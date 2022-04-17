class GameOrder < ApplicationRecord
  belongs_to :game
  belongs_to :order
end
