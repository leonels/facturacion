class ChangePrecisionAndScaleOfCostInItems < ActiveRecord::Migration
  def change
    change_column :items, :cost, :decimal, :precision => 10, :scale => 2
  end
end
