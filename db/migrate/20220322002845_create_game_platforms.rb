class CreateGamePlatforms < ActiveRecord::Migration[7.0]
  def change
    create_table :game_platforms do |t|
      t.references :Game, null: false, foreign_key: true
      t.references :Platform, null: false, foreign_key: true

      t.timestamps
    end
  end
end
