class AddTaxToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :tax, :float
  end
end
