class Account < ActiveRecord::Base

  has_many :companies, :dependent => :destroy
  has_many :users, :dependent => :destroy

  accepts_nested_attributes_for :companies
  accepts_nested_attributes_for :users

end
