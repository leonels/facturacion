class Organization < ActiveRecord::Base
  belongs_to :account
  has_many :contacts, :dependent => :destroy
  accepts_nested_attributes_for :contacts
  validates :account_id, :presence => true
end
