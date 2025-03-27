# models/event_registration.py
from odoo import models, fields, api, _
from odoo.exceptions import ValidationError, UserError


class Registration(models.Model):
    _name = 'event.registration'
    _description = 'Event Registration'
    _rec_name = 'name'

    _order = 'registration_date desc'

    name = fields.Char(string='Mã đăng ký', required=True, copy=False, readonly=True, default=lambda self: _('New'))
    event_id = fields.Many2one('event.management', string="Sự kiện", required=True, tracking=True)
    member_id = fields.Many2one('clb.member', string="Người đăng ký", default=lambda self: self._get_current_member(),tracking=True)
    active = fields.Boolean(string="Active", default=True)
    registration_date = fields.Datetime(string='Ngày đăng ký', default=fields.Datetime.now, tracking=True)
    clb_id = fields.Many2one('clb.management', string="CLB đăng ký", tracking=True)
    type = fields.Selection([
        ('individual', 'Cá nhân'),
        ('club', 'CLB')
    ], string='Loại đăng ký', required=True, default='individual', tracking=True)

    state = fields.Selection([
        ('draft', 'Chưa duyệt'),
        ('confirm', 'Đã duyệt'),
        ('cancel', 'Đã hủy')
    ], string='Trạng thái', default='draft', tracking=True)

    event_date = fields.Datetime(related='event_id.start_date', string='Ngày diễn ra', store=True)
    event_location = fields.Char(related='event_id.location', string='Địa điểm', store=True)
    note = fields.Text(string='Ghi chú')
    active = fields.Boolean(default=True)
    member_code = fields.Char(
        string="Mã thành viên",
        compute="_compute_member_code",
        store=False
    )

    @api.depends('member_id')
    def _compute_member_code(self):
        for record in self:
            if record.member_id:
                record.member_code = record.member_id.code  # Lấy mã thành viên từ member_id
            else:
                # Nếu chưa có member_id, lấy thành viên liên kết với user hiện tại
                current_user = self.env.user
                member = self.env['clb.member'].search([('user_id', '=', current_user.id)], limit=1)
                record.member_code = member.code if member else _('N/A')

    @api.model
    def _get_current_member(self):
        current_user = self.env.user
        member = self.env['clb.member'].search([('user_id', '=', current_user.id)], limit=1)
        return member.id if member else False

    @api.constrains('member_id')
    def _check_member_access(self):
        for reg in self:
            if reg.type == 'individual':
                current_user = self.env.user
                if not current_user.has_group('clb.group_event_admin'):
                    current_member = self.env['clb.member'].search([('user_id', '=', current_user.id)], limit=1)
                    if not current_member:
                        raise ValidationError(_('Bạn cần phải là thành viên để đăng ký sự kiện!'))
                    if reg.member_id != current_member:
                        raise ValidationError(_('Bạn chỉ có thể đăng ký sự kiện cho chính mình!'))

    @api.model_create_multi
    def create(self, vals_list):
        for vals in vals_list:
            if vals.get('name', _('New')) == _('New'):
                vals['name'] = self.env['ir.sequence'].next_by_code('event.registration') or _('New')

            if vals.get('type') == 'individual' and not vals.get('member_id'):
                vals['member_id'] = self._get_current_member()

            if vals.get('type') == 'individual':
                current_user = self.env.user
                if not current_user.has_group('clb.group_event_admin'):
                    current_member = self.env['clb.member'].search([('user_id', '=', current_user.id)], limit=1)
                    if vals.get('member_id') and vals.get('member_id') != current_member.id:
                        raise ValidationError(_('Bạn chỉ có thể đăng ký sự kiện cho chính mình!'))

        return super(Registration, self).create(vals_list)

    @api.onchange('type')
    def _onchange_type(self):
        if self.type == 'individual':
            self.clb_id = False
        else:
            self.member_id = False

    @api.onchange('event_id')
    def _onchange_event_id(self):
        if self.event_id:
            if self.event_id.state not in ('in_progress', 'confirm'):
                raise ValidationError(_('Chỉ có thể đăng ký cho sự kiện đang mở đăng ký!'))
            if self.event_id.state == 'done' or self.event_id.state == 'cancel':
                raise ValidationError(_('Đã hết hạn đăng ký cho sự kiện này!'))

    @api.constrains('event_id', 'member_id', 'clb_id', 'type')
    def _check_registration(self):
        for reg in self:
            if reg.type == 'individual' and not reg.member_id:
                raise ValidationError(_('Vui lòng chọn người đăng ký cho đăng ký cá nhân!'))
            if reg.type == 'club' and not reg.clb_id:
                raise ValidationError(_('Vui lòng chọn CLB cho đăng ký theo CLB!'))

            if reg.event_id.max_participants > 0:
                current_participants = len(reg.event_id.participant_ids)
                if reg.type == 'individual' and current_participants >= reg.event_id.max_participants:
                    raise ValidationError(_('Sự kiện đã đạt số lượng người tham gia tối đa!'))
                if reg.type == 'club':
                    club_members = len(self.env['clb.member'].search([('clb_id', '=', reg.clb_id.id)]))
                    if current_participants + club_members > reg.event_id.max_participants:
                        raise ValidationError(_('Số lượng thành viên CLB vượt quá số lượng còn lại có thể đăng ký!'))

            if reg.type == 'club' and reg.event_id.event_type != 'public':
                raise ValidationError(_('Chỉ có thể đăng ký theo CLB cho sự kiện công khai!'))

            if reg.type == 'individual':
                self._check_time_conflict(reg.member_id, reg.event_id)

            if reg.type == 'club':
                members = self.env['clb.member'].search([('clb_id', '=', reg.clb_id.id)])
                for member in members:
                    self._check_time_conflict(member, reg.event_id)

    def _check_time_conflict(self, member, event):
        overlapping = self.env['event.registration'].search([
            ('state', '=', 'confirm'),
            '|',
            ('member_id', '=', member.id),
            '&', ('clb_id', '=', member.clb_id.id), ('type', '=', 'club'),
            ('event_id', '!=', event.id),
            '|',
            '&',
            ('event_id.start_date', '<=', event.start_date),
            ('event_id.end_date', '>=', event.start_date),
            '&',
            ('event_id.start_date', '<=', event.end_date),
            ('event_id.end_date', '>=', event.end_date)
        ])
        if overlapping:
            raise ValidationError(_('Thành viên %s đã đăng ký sự kiện khác trong khoảng thời gian này!') % member.name)

    def action_confirm(self):
        for reg in self:
            if reg.state != 'draft':
                continue

            if reg.type == 'club':
                members = self.env['clb.member'].search([('clb_id', '=', reg.clb_id.id)])
                if members:
                    reg.event_id.write({
                        'participant_ids': [(4, member.id) for member in members]
                    })
            elif reg.type == 'individual':
                reg.event_id.write({
                    'participant_ids': [(4, reg.member_id.id)]
                })

            reg.write({
                'state': 'confirm',
                'registration_date': fields.Datetime.now()
            })


    def action_cancel(self):
        for reg in self:
            if reg.state == 'cancel':
                continue

            if reg.type == 'individual':
                reg.event_id.write({
                    'participant_ids': [(3, reg.member_id.id)]
                })
            else:
                members = self.env['clb.member'].search([('clb_id', '=', reg.clb_id.id)])
                reg.event_id.write({
                    'participant_ids': [(3, member.id) for member in members]
                })

            reg.write({'state': 'cancel'})


    def action_draft(self):
        for reg in self:
            if reg.state == 'cancel':
                reg.write({'state': 'draft'})

    def unlink(self):
        for reg in self:
            if reg.state != 'draft':
                raise UserError(_('Chỉ có thể xóa đăng ký ở trạng thái bản nháp!'))
        return super(Registration, self).unlink()