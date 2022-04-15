class DropUserIdFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :user_id
  end
end
