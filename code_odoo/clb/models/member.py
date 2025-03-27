from odoo import models, fields, api, _
from odoo.exceptions import ValidationError, UserError, AccessError

class Member(models.Model):
    _name = 'clb.member'
    _description = 'Club Member'
    _rec_name = 'name'

    name = fields.Char(string="Tên", required=True)
    code = fields.Char(string="Mã thành viên", readonly=True, default=lambda self: _('New'))
    image = fields.Binary(string="Hình ảnh", attachment=True)
    country_id = fields.Many2one('res.country', string="Quê quán")
    gender = fields.Selection([('male', 'Nam'), ('female', 'Nữ')], string="Giới tính")
    day_of_birth = fields.Date(string="Ngày sinh")
    email = fields.Char(string="Email", required=True)
    phone = fields.Char(string="SĐT")
    position = fields.Selection([('leader', 'Trưởng nhóm'), ('member', 'Thành viên')], string="Chức vụ")
    clb_id = fields.Many2one('clb.management', string="CLB")
    is_leader = fields.Boolean(string="Is Leader", compute="_compute_is_leader", store=True)
    user_id = fields.Many2one('res.users', string="Tài khoản", readonly=True)

    @api.depends('position')
    def _compute_is_leader(self):
        for record in self:
            record.is_leader = record.position == 'leader'

    @api.model_create_multi
    def create(self, vals_list):
        users_model = self.env['res.users']
        for vals in vals_list:
            # Tạo mã thành viên tự động
            if vals.get('code', _('New')) == _('New'):
                vals['code'] = self.env['ir.sequence'].next_by_code('clb.member') or _('New')

            # Kiểm tra quyền của người dùng
            # if self.env.user.has_group('clb.group_event_leader'):
            #     clb_id = vals.get('clb_id')
            #     if clb_id:
            #         club = self.env['clb.management'].browse(clb_id)
            #         if not club or not club.member_ids.filtered(lambda m: m.user_id == self.env.user):
            #             raise AccessError(_("Bạn không thể thêm thành viên vào CLB không thuộc quyền quản lý của bạn."))

            # Kiểm tra và tạo tài khoản người dùng
            if 'email' in vals and vals['email']:
                existing_user = users_model.search([('login', '=', vals['email'])], limit=1)
                if existing_user:
                    raise ValidationError(_("Email này đã được sử dụng cho một tài khoản khác."))

                # Xác định nhóm quyền dựa trên chức vụ
                groups = []
                if vals.get('position') == 'leader':
                    groups.append(self.env.ref('clb.group_event_leader').id)
                else:  # Mặc định là thành viên
                    groups.append(self.env.ref('clb.group_event_member').id)

                # Tạo tài khoản người dùng
                user_vals = {
                    'name': vals['name'],
                    'login': vals['email'],
                    'email': vals['email'],
                    'password': '123456',  # Mật khẩu mặc định
                    'groups_id': [(6, 0, groups)],
                }
                user = users_model.create(user_vals)
                #
                # # Gửi email yêu cầu đặt lại mật khẩu
                # user._send_reset_password_email()

                # Gắn tài khoản với thành viên
                vals['user_id'] = user.id

        return super(Member, self).create(vals_list)

    def unlink(self):
        for member in self:
            # Kiểm tra quyền xóa
            if self.env.user.has_group('clb.group_event_leader'):
                if member.position == 'leader':
                    raise UserError(_('Không thể xóa trưởng nhóm khỏi CLB!'))
                if member.clb_id and member.clb_id not in self.env['clb.management'].search([('member_ids.user_id', '=', self.env.user.id)]):
                    raise AccessError(_("Bạn không thể xóa thành viên không thuộc CLB của bạn."))

            # Xóa tài khoản người dùng nếu có
            if member.user_id:
                member.user_id.unlink()

        return super(Member, self).unlink()

    def action_remove_from_club(self):
        for member in self:
            if member.position == 'leader':
                raise UserError(_('Không thể xóa trưởng nhóm khỏi CLB!'))
            member.write({'clb_id': False, 'position': False})
        return True

