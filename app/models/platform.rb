class Platform < ApplicationRecord
    has_many :Games, :through :game_platforms
end
