class GameOrder < ApplicationRecord
  belongs_to :Game
  belongs_to :Order
end
