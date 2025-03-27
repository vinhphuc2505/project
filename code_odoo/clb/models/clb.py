from odoo import models, fields, api, _
from odoo.exceptions import UserError, ValidationError

class CLB(models.Model):
    _name = 'clb.management'
    _description = 'Club Management'
    _rec_name = 'name'

    name = fields.Char(string="Tên CLB", required=True)
    code = fields.Char(string="Mã CLB", readonly=True, default=lambda self: _('New'))
    image = fields.Binary(string="Logo", attachment=True)
    description = fields.Text(string="Miêu tả")
    member_ids = fields.One2many('clb.member', 'clb_id', string="Thành viên")

    leader_name = fields.Char(
        string="Trưởng nhóm",
        compute="_compute_leader_name",
        store=True
    )

    leader_count = fields.Integer(
        string="Số trưởng nhóm",
        compute='_compute_leader_count',
    )

    @api.depends('member_ids.position')
    def _compute_leader_name(self):
        for record in self:
            leaders = record.member_ids.filtered(lambda m: m.position == 'leader')
            record.leader_name = leaders[0].name if leaders else ""

    @api.depends('member_ids.position')
    def _compute_leader_count(self):
        for record in self:
            record.leader_count = len(record.member_ids.filtered(lambda m: m.position == 'leader'))

    @api.constrains('member_ids')
    def _check_leader_count(self):
        for record in self:
            leaders = record.member_ids.filtered(lambda m: m.position == 'leader')
            if len(leaders) > 1:
                raise ValidationError(_('Mỗi CLB chỉ được phép có một trưởng nhóm!'))

    def action_view_free_members(self):
        return {
            'name': 'Thành viên tự do',
            'type': 'ir.actions.act_window',
            'res_model': 'clb.member',
            'view_mode': 'tree,form',
            'domain': [('clb_id', '=', False)],
            'context': {
                'default_clb_id': self.id,
            },
            'target': 'current',
        }

    @api.model_create_multi
    def create(self, vals_list):
        for vals in vals_list:
            # Tạo mã CLB tự động
            if vals.get('code', _('New')) == _('New'):
                vals['code'] = self.env['ir.sequence'].next_by_code('clb.management') or _('New')
        return super(CLB, self).create(vals_list)

    # def action_view_free_members(self):
    #     if not self.env.user.has_group('clb.group_event_admin'):
    #         raise AccessError(_("Bạn không có quyền truy cập vào chức năng này."))
    #     return super(CLB, self).action_view_free_members()



