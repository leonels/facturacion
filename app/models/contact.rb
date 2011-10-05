class Contact < ActiveRecord::Base
  belongs_to :organization
  belongs_to :account
  validates :account_id, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  
  def full_name
    if (!first_name.empty? && !last_name.empty?)
      first_name + ' ' + last_name
    else
      'not set'
    end
  end
  
end
