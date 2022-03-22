class Genre < ApplicationRecord
    has_many :Games, :through :game_genres
end
