class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :home_phone
      t.string :mobile_phone
      t.string :work_phone

      t.timestamps
    end
  end
end
