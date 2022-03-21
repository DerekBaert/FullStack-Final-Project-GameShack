class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.text :address
      t.string :email
      t.string :phone_number
      t.boolean :admin

      t.timestamps
    end
  end
end
