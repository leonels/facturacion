class Invoice < ActiveRecord::Base
  belongs_to :account
  belongs_to :organization
  has_many :line_items, :dependent => :destroy
  
  validates :account_id, :presence => true
  validates :organization_id, :presence => true
  
  # accepts_nested_attributes_for :line_items, :reject_if => lambda { |a| a[:item_id].nil? }
  accepts_nested_attributes_for :line_items, :reject_if => :reject_line_items
  
  def reject_line_items(attributed)
    attributed['item_id'].blank?
  end

  # def organization_name
    # organization.name if organization
  # end

  # def organization_name=(name)
    # self.organization = Organization.find_or_create_by_name(name) unless name.blank?
    # account = Account.find_by_subdomain(request.subdomain)
    # self.organization = Organization.find_or_initialize_by_name_and_account_id(name, self.account_id) unless name.blank?
    # self.organization = Organization.find_or_create_by_name_and_account_id(name, self.account_id) unless name.blank?
    
    # self.organization = Organization.find_by_name(name) unless name.blank?
    # if self.organization.nil?
      # o = Organization.new
      # o = Organization.create(:name => name, :account_id => self.account_id)
      # o.name = name
      # o.account_id = self.account_id
      # o.save
      # self.organization_id = o.id
      # self.organization = o
    # end
    # self.organization
    
    # account = Account.find_by_subdomain(request.subdomain)
    # organization = account.organizations.create(:name => name)
    # account.save
    # organization.invoices.create
    # organization.save
    
    # if self.organization_id.nil?
      # o = Organization.find_by_name(name)
      # self.organization_id = o.id
    # end
  # end

end
