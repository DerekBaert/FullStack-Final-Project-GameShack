class Order < ApplicationRecord
  belongs_to :status
  belongs_to :user

  has_many :game_orders, dependent: :delete_all
  has_many :games, through: :game_orders
  accepts_nested_attributes_for :game_orders, allow_destroy: true

  has_many :platform_orders, dependent: :delete_all
  has_many :platforms, through: :platform_orders
  accepts_nested_attributes_for :platform_orders, allow_destroy: true
end
