class DropControllerTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :controllers
  end
end
