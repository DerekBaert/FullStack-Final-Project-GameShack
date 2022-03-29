class Order < ApplicationRecord
  belongs_to :user
  has_many :Games, through: :game_orders

  validates :number, :user_id, :price, presence: true
  validates :number, :user_id, :price, numericality: true
end
