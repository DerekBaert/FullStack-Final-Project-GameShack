class Platform < ApplicationRecord
    has_many :game_platforms, dependent: :delete_all
    has_many :games, through: :game_platforms

    has_many :platform_orders, dependent: :delete_all
    has_many :Orders, through: :platform_orders

    has_one_attached :image

    validates :name, :price, :description, presence: true
    validates :price, numericality: true
end
