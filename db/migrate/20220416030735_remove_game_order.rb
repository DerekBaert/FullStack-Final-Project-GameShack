class RemoveGameOrder < ActiveRecord::Migration[7.0]
  def change
    drop_table :game_orders
  end
end
