class ChangePrecisionAndScaleOfCostInLineItems < ActiveRecord::Migration
  def change
    change_column :line_items, :cost, :decimal, :precision => 10, :scale => 2
  end
end
