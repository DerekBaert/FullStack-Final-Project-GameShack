# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'uri'
GameGenre.delete_all
GamePlatform.delete_all
Game.delete_all
Genre.delete_all
Platform.delete_all


for i in 0..49    
    game = Game.create(
        name: Faker::Game.title,
        price: Faker::Commerce.price(range: 59.99..89.99),
        description: Faker::Lorem.paragraph(sentence_count: 2)
    )
    image = URI.open("https://source.unsplash.com/600x600/?#{URI.escape(game.name)}")
    game.image.attach(io: image, filename:"#{game.name}.jpg")
    for j in 0..1
        genre = Genre.find_or_create_by(name: Faker::Game.genre)
        GameGenre.find_or_create_by(Game_id: game.id, Genre_id: genre.id) 
    end

    for j in 0..1
        platform = Platform.find_or_create_by(name: Faker::Game.platform)
        if(!platform.price)
            platform.price = Faker::Commerce.price(range: 199.99..699.99)
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