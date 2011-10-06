class Organization < ActiveRecord::Base
  belongs_to :account
  has_many :contacts, :dependent => :destroy
  has_many :invoices
  accepts_nested_attributes_for :contacts
  accepts_nested_attributes_for :invoices
  validates :account_id, :presence => true
  validates :name, :uniqueness => true
  
  def formatted_address
    a = "#{name} <br />" unless name.empty?
    a = "#{a} #{address_one} <br />" unless address_one.empty?
    a = "#{a} #{address_two} <br />" unless address_two.empty?
    a = "#{a} #{city} " unless self.city.empty?
    a = "#{a} #{state} " unless state.empty?
    a = "#{a} #{zipcode} <br />" unless zipcode.empty?
    a = "#{a} #{business_phone} <br />" unless business_phone.empty?
    a = "#{a} #{fax} <br />" unless fax.empty?
    a = "#{a} #{website}" unless website.empty?
    a
  end  
  
  # before_save :default_values
  # def default_values
  #   self.account_id = current_user.account_id
  # end
  
end
