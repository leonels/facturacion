class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice
  
  # validates :item_id, :presence => true
  # validates :invoice_id, :presence => true
  
  before_save :default_values
  
  def default_values
    self.quantity = 1 unless self.quantity
  end
  
end
