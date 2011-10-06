class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice
  
  # validates :item_id, :presence => true
  # validates :invoice_id, :presence => true
  
  before_save :default_values
  
  def line_total
    cost * quantity
  end
  
  def default_values
    self.quantity = 1 unless self.quantity
    self.cost = item.cost unless self.cost
  end

end
