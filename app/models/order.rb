class Order < ApplicationRecord
  belongs_to :status
  belongs_to :user

  has_many :game_orders, dependent: :delete_all
  has_many :games, through: :game_orders

  has_many :platform_orders, dependent: :delete_all
  has_many :platforms, through: :platform_orders
end
