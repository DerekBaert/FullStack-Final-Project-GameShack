class CreateGameOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :game_orders do |t|
      t.references :Game, null: false, foreign_key: true
      t.references :Order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
