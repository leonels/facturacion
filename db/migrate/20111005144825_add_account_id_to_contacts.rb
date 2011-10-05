class AddAccountIdToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :account_id, :integer
  end
end
