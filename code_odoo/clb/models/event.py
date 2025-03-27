from odoo import models, fields, api, _
from odoo.exceptions import ValidationError, UserError
from datetime import datetime


class Event(models.Model):
    _name = 'event.management'
    _description = 'Event Management'
    _rec_name = 'name'

    name = fields.Char(string='Tên sự kiện', required=True)
    code = fields.Char(string='Mã sự kiện', readonly=True, default=lambda self: _('New'))
    start_date = fields.Datetime(string='Ngày bắt đầu', required=True)
    end_date = fields.Datetime(string='Ngày kết thúc', required=True)
    location = fields.Char(string='Địa điểm', required=True)
    description = fields.Text(string='Mô tả')

    max_participants = fields.Integer(string='Số người tối đa', required=True)
    min_participants = fields.Integer(string='Số người tối thiểu', required=True)
    participant_ids = fields.Many2many(
        'clb.member',
        'event_participant_rel',
        'event_id',
        'member_id',
        string='Thành viên tham gia'
    )

    invited_member_ids = fields.Many2many(
        'clb.member',
        'event_invite_rel',
        'event_id',
        'member_id',
        string='Thành viên được mời'
    )
    current_participants = fields.Integer(
        string='Số người hiện tại',
        compute='_compute_current_participants'
    )

    clb_id = fields.Many2one('clb.management', string='CLB tổ chức', required=True)
    event_type = fields.Selection([
        ('public', 'Công khai'),
        ('private', 'Nội bộ CLB'),
        ('invite', 'Chỉ mời')
    ], string='Loại sự kiện', required=True, default='public')

    state = fields.Selection([
        ('draft', 'Chưa xác nhận'),
        ('confirm', 'Mở đăng ký'),
        ('in_progress', 'Đang diễn ra'),
        ('done', 'Hoàn thành'),
        ('cancel', 'Hủy bỏ')
    ], string='Trạng thái', default='draft')

    estimated_costs = fields.One2many(
        'estimated.costs', 'event_id', string='Chi phí dự kiến'
    )
    actual_costs = fields.One2many(
        'actual.costs', 'event_id', string='Chi phí thực tế'
    )

    @api.model_create_multi
    def create(self, vals_list):
        for vals in vals_list:
            if vals.get('code', _('New')) == _('New'):
                vals['code'] = self.env['ir.sequence'].next_by_code('event.management') or _('New')
        return super().create(vals_list)

    @api.constrains('start_date', 'end_date')
    def _check_dates(self):
        for event in self:
            if event.start_date > event.end_date:
                raise ValidationError(_('Ngày kết thúc phải sau ngày bắt đầu!'))

    @api.constrains('max_participants', 'min_participants')
    def _check_participants_limit(self):
        for event in self:
            if event.max_participants < event.min_participants:
                raise ValidationError(_('Số người tối đa phải lớn hơn số người tối thiểu!'))

    @api.constrains('participant_ids', 'event_type', 'invited_member_ids', 'clb_id')
    def _check_participants(self):
        for event in self:
            if event.event_type == 'private' and any(m.clb_id.id != event.clb_id.id for m in event.participant_ids):
                raise ValidationError(_('Sự kiện nội bộ chỉ cho phép thành viên CLB tham gia!'))

            if event.event_type == 'invite' and any(m not in event.invited_member_ids for m in event.participant_ids):
                raise ValidationError(_('Chỉ những thành viên được mời mới có thể tham gia sự kiện này!'))

    @api.depends('participant_ids')
    def _compute_current_participants(self):
        for event in self:
            event.current_participants = len(event.participant_ids)

    def action_register_event(self, member_id):
        """Đăng ký tham gia sự kiện"""
        self.ensure_one()
        if self.state != 'confirm':
            raise UserError(_('Chỉ có thể đăng ký sự kiện đã được xác nhận!'))
        if self.current_participants >= self.max_participants:
            raise UserError(_('Sự kiện đã đạt số lượng người tham gia tối đa!'))

        member = self.env['clb.member'].browse(member_id)
        if self.event_type == 'private' and member.clb_id.id != self.clb_id.id:
            raise UserError(_('Bạn không phải thành viên của CLB tổ chức!'))
        if self.event_type == 'invite' and member.id not in self.invited_member_ids.ids:
            raise UserError(_('Bạn không có trong danh sách mời!'))

        self.write({'participant_ids': [(4, member_id)]})

    def action_confirm(self):
        self.state = 'confirm'

    def action_start(self):
        if self.state != 'confirm':
            raise UserError(_('Chỉ có thể bắt đầu sự kiện đã được xác nhận!'))
        self.state = 'in_progress'

    def action_done(self):
        if self.state != 'in_progress':
            raise UserError(_('Chỉ có thể hoàn thành sự kiện đang diễn ra!'))
        self.state = 'done'

    def action_cancel(self):
        if self.state in ['done', 'cancel']:
            raise UserError(_('Không thể hủy sự kiện đã hoàn thành hoặc đã bị hủy!'))
        self.state = 'cancel'

    def action_actual_costss(self):
        """Hành động xử lý chi phí thực tế."""
        self.ensure_one()
        if self.state not in ['in_progress', 'done']:
            raise UserError(_('Chỉ có thể nhập chi phí thực tế khi sự kiện đang diễn ra hoặc đã hoàn thành!'))
        return {
            'type': 'ir.actions.act_window',
            'name': _('Nhập chi phí thực tế'),
            'res_model': 'actual.costs',
            'view_mode': 'form',
            'target': 'new',
            'context': {
                'default_event_id': self.id
            },
        }

    def action_estimated_costs(self):
        self.ensure_one()
        return {
            'type': 'ir.actions.act_window',
            'name': _('Nhập chi phí ước tính'),
            'res_model': 'estimated.costs',
            'view_mode': 'form',
            'target': 'new',
            'context': {
                'default_event_id': self.id
            },
        }

    @api.model
    def update_event_states(self):
        """Kiểm tra và cập nhật trạng thái của sự kiện."""
        now = datetime.now()
        events_to_start = self.search([
            ('state', '=', 'confirm'),
            ('start_date', '<=', now),
            ('end_date', '>', now)
        ])
        for event in events_to_start:
            event.state = 'in_progress'

        events_to_finish = self.search([
            ('state', '=', 'in_progress'),
            ('end_date', '<=', now)
        ])
        for event in events_to_finish:
            event.state = 'done'
