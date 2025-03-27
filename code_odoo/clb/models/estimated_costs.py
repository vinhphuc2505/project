from odoo import models, fields


class EstimatedCosts(models.Model):
    _name = 'estimated.costs'
    _description = 'Chi phí dự kiến'

    name = fields.Char(string="Tên chi phí", required=True)
    amount = fields.Float(string="Số tiền", required=True)
    event_id = fields.Many2one(
        'event.management', string="Sự kiện",
        ondelete='cascade', required=True)
