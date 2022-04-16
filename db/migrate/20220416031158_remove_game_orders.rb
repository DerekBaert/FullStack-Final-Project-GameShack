class RemoveGameOrders < ActiveRecord::Migration[7.0]
  def change
    drop_table :games_orders
  end
end
