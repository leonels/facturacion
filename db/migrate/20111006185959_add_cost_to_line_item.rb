class AddCostToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :cost, :decimal
  end
end
