class Game < ApplicationRecord
    has_many :game_genres, dependent: :delete_all
    has_many :genres, through: :game_genres
    accepts_nested_attributes_for :game_genres, allow_destroy: true

    has_many :game_orders, dependent: :delete_all
    has_many :orders, through: :game_orders

    has_many :game_platforms, dependent: :delete_all
    has_many :platforms, through: :game_platforms
    accepts_nested_attributes_for :game_platforms, allow_destroy: true
    
    has_one_attached :image

    validates :name, :price, :description, presence: true
    validates :price, numericality: true
    def self.search(search)
        if search 
            where(["name LIKE ?","%#{search}%"])
        else
            all
        end
    end 
end
