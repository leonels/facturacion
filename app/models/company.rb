class Company < ActiveRecord::Base
  belongs_to :account
  has_many :users
  validates :account_id, :presence => true
  
  def formatted
    a = "<strong>#{name}</strong> <br />" unless name.blank?
    a = "#{a} #{address_one} <br />" unless address_one.blank?
    a = "#{a} #{address_two} <br />" unless address_two.blank?
    a = "#{a} #{city} " unless self.city.blank?
    a = "#{a} #{state} " unless state.blank?
    a = "#{a} #{zipcode} <br />" unless zipcode.blank?
    a = "#{a} #{phone} <br />" unless phone.blank?
    a = "#{a} #{fax} <br />" unless fax.blank?
    a = "#{a} #{website}" unless website.blank?
    a
  end

end
