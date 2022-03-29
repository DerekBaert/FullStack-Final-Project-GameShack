class Genre < ApplicationRecord
    has_many :game_genres, dependent: :delete_all
    has_many :Games, through: :game_genres

    validates :name, presence: true
end
