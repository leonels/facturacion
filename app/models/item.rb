class Item < ActiveRecord::Base
  belongs_to :account
  has_many :line_items

  validates :account_id, :presence => true
  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :cost, :presence => true
  validates :cost, :numericality => {:greater_than_or_equal_to => 0.01}
  
  before_destroy :ensure_not_referenced_by_any_line_item
  
  private
  
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
  
end
