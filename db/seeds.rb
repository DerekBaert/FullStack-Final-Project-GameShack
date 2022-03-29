# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'uri'
require 'open-uri'
require "json"

key = '2d85f2dfc0c87ca82eba3b139d9b58d59079e080'
def fetch(url)
    JSON.parse(URI.open(url).read)
end

# Switch - 157
# PS5 - 176
# Xbox Series S/X - 179
# Xbox One - 145
# PS4 - 146
# platforms = [157, 176, 179, 145, 146]
# platforms.each do |p|
#     platform = fetch("https://www.giantbomb.com/api/platform/#{p}/?api_key=#{key}&format=json")['results']
#     platform_name =  platform['name']
#     platform_description = platform['deck']
#     platform_price = platform['original_price']
#     image = URI.open(platform['image']['medium_url'])
#     #  platform.image.attach(io: image, filename:"#{platform.name}.jpg")

#     game_results = fetch("https://www.giantbomb.com/api/games/?api_key=#{key}&limit=25&format=json&platforms=#{p}&filter=original_release_date:#{DateTime.now - 1825}|#{DateTime.now}")['results']
#     game_reults.each do |game|
#         game_name = game['name']
#         game_description = game['deck']
#     end
# end
    
# GiantBomb::Search.new().query(Faker::Game.title).resources('game').fetch.each do |game|
#     puts game["name"]
# end

GameGenre.delete_all
GamePlatform.delete_all
Game.delete_all
Genre.delete_all
Platform.delete_all

ratings = ["Everyone", "Teen", "Mature"]
for i in 0..49    
    game = Game.find_or_create_by(name: Faker::Game.title)
    game.price = Faker::Commerce.price(range: 59.99..89.99)
    game.description = Faker::Lorem.paragraph(sentence_count: 2)
    game.age_rating = ratings.sample
    game.save
    image = URI.open("https://source.unsplash.com/600x600/?#{URI.escape(game.name)}")
    game.image.attach(io: image, filename:"#{game.name}.jpg")
    for j in 0..1
        genre = Genre.find_or_create_by(name: Faker::Game.genre)
        GameGenre.find_or_create_by(Game_id: game.id, Genre_id: genre.id) 
    end

    for j in 0..1
        platform = Platform.find_or_create_by(name: Faker::Game.platform)
        if(!platform.price)
            platform.price = Faker::Commerce.price(range: 199.99..699.99).round(2)
        end
        if(!platform.description)
            platform.description = Faker::Lorem.paragraph(sentence_count: 2)
        end
        image = URI.open("https://source.unsplash.com/600x600/?#{URI.escape(platform.name)}")
        platform.image.attach(io: image, filename:"#{platform.name}.jpg")
        platform.save
        GamePlatform.find_or_create_by(Game_id: game.id, Platform_id: platform.id)
    end
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
