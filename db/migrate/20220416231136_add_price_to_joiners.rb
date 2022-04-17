class AddPriceToJoiners < ActiveRecord::Migration[7.0]
  def change
    add_column :game_orders, :price, :float
    add_column :platform_orders, :price, :float
  end
end
