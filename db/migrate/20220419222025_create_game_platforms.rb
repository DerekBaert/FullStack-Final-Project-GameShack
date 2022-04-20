class CreateGamePlatforms < ActiveRecord::Migration[7.0]
  def change
    drop_table :game_platforms
    create_table :game_platforms do |t|
      t.references :game, null: false, foreign_key: true
      t.references :platform, null: false, foreign_key: true

      t.timestamps
    end

    create_table :game_genres do |t|
      t.references :game, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
