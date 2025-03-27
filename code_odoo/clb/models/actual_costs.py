from odoo import models, fields

class ActualCosts(models.Model):
    _name = 'actual.costs'
    _description = 'Actual Costs'

    name = fields.Char(string='Tên chi phí', required=True)
    amount = fields.Float(string='Số tiền', required=True)
    event_id = fields.Many2one(
        comodel_name='event.management',
        string='Sự kiện',
        ondelete='cascade',
        required=True
    )
