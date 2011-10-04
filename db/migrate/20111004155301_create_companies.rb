class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :phone
      t.string :fax
      t.string :website
      t.integer :account_id

      t.timestamps
    end
  end
end
