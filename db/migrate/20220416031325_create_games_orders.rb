class CreateGamesOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :game_orders do |t|
      t.references :game_id, null: false, foreign_key: true
      t.references :order_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
