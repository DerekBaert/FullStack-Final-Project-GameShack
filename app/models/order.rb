class Order < ApplicationRecord
  belongs_to :user
  has_many :Games, :through :game_orders
end
