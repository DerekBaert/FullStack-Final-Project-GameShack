class AddNameToProvince < ActiveRecord::Migration[7.0]
  def change
    add_column :provinces, :name, :string
  end
end
