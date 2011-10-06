class Tax < ActiveRecord::Base
  belongs_to :account
  validates :account_id, :presence => true
  validates :name, :presence => true
  validates :rate, :presence => true
  validates :rate, :numericality => {:greater_than_or_equal_to => 0.01}
end
