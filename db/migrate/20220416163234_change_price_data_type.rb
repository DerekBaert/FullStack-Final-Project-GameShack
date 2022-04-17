class ChangePriceDataType < ActiveRecord::Migration[7.0]
  def change
    change_column(:orders, :price, :float)
  end
end
