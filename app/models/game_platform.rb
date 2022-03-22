class GamePlatform < ApplicationRecord
  belongs_to :Game
  belongs_to :Platform
end
