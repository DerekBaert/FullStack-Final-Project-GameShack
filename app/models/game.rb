class Game < ApplicationRecord
    has_many :Genres, :through :game_genres
    has_many :Orders, :through :game_orders
    has_many :Platforms, :through :game_platforms
end
