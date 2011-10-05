class Organization < ActiveRecord::Base
  belongs_to :account
  has_many :contacts, :dependent => :destroy
  has_many :invoices
  accepts_nested_attributes_for :contacts
  accepts_nested_attributes_for :invoices
  validates :account_id, :presence => true
  validates :name, :uniqueness => true
  
  # before_save :default_values
  # def default_values
  #   self.account_id = current_user.account_id
  # end
  
end
