class DropGamePlatform2 < ActiveRecord::Migration[7.0]
  def change
    drop_table :game_genres
  end
end
