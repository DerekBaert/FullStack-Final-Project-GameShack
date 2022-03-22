class GameGenre < ApplicationRecord
  belongs_to :Game
  belongs_to :Genre
end
