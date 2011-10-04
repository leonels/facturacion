class AddAccountIdToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :account_id, :integer
  end
end
