class Account < ActiveRecord::Base

  has_many :organizations, :dependent => :destroy
  has_many :companies, :dependent => :destroy
  has_many :users, :dependent => :destroy
  has_many :contacts, :dependent => :destroy
  has_many :items, :dependent => :destroy
  has_many :invoices, :dependent => :destroy

  accepts_nested_attributes_for :companies
  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :organizations
  accepts_nested_attributes_for :contacts
  accepts_nested_attributes_for :items
  accepts_nested_attributes_for :invoices

end
