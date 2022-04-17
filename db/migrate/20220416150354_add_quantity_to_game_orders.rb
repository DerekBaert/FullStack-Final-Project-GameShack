class AddQuantityToGameOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :game_orders, :quantity, :integer
  end
end
