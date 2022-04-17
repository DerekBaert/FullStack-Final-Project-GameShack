class CreatePlatformOrders < ActiveRecord::Migration[7.0]
  def change
    drop_table :platform_orders
    create_table :platform_orders do |t|
      t.references :platform, null: false, foreign_key: true
      t.references :Order, null: false, foreign_key: true
      t.integer :Quantity

      t.timestamps
    end
  end
end
