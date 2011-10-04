class Account < ActiveRecord::Base

  has_many :organizations, :depedent => :destroy
  has_many :companies, :dependent => :destroy
  has_many :users, :dependent => :destroy

  accepts_nested_attributes_for :companies
  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :organizations

end
