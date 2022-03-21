class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :number
      t.references :user, null: false, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
