class Contact < ActiveRecord::Base
  belongs_to :organization
  belongs_to :account
  validates :account_id, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  
  def full_name
    first_name + ' ' + last_name
  end
  
end
