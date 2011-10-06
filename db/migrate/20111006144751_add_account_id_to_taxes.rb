class AddAccountIdToTaxes < ActiveRecord::Migration
  def change
    add_column :taxes, :account_id, :integer
  end
end
