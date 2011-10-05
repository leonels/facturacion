class Company < ActiveRecord::Base
  belongs_to :account
  validates :account_id, :presence => true
end
