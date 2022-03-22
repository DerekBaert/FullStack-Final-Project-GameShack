class CreateGameGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :game_genres do |t|
      t.references :Game, null: false, foreign_key: true
      t.references :Genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
