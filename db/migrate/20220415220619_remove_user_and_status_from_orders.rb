class RemoveUserAndStatusFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_reference :orders, :user, null: false, foreign_key: true
    remove_reference :orders, :status, null: false, foreign_key: true
  end
end
