require 'faker'
require 'uri'
require 'open-uri'
require 'json'
require 'net/https'

# GameGenre.delete_all
# GamePlatform.delete_all
# Game.delete_all
# Genre.delete_all
# Platform.delete_all


# provinces = ["Alberta", "British Colombia", "Manitoba", "New Brunswick", "Newfoundland and Labrador", "Nova Scotia", "Ontario", 
#     "Prince Edward Island", "Quebec", "Saskatchewan", "Northwest Territories", "Nunavut", "Yukon"]

#     provinces.each do |province|
#         Province.find_or_create_by(name: province)
#     end

# Variables for the IGDB api credentials
client_id = 'dnk3ybvozhyxj1fsck4crna182t1yy'
access_token = 'pnjn9uifrk7x1glwr0e3w2xperoc5r'
def find_rating(rating)
    case rating
    when 8
        game_rating = "E"
    when 10
        game_rating = "T"
    when 11
        game_rating = "M"
    end 
    return game_rating
end
# Function to take a list and present them as a comma separated list
def comma_list(array, key)
    list = nil
    first = true
    array.each do |item|
        if(first)
            list = item[key]
            first = false
        else
            list = "#{list}, #{item[key]}"
        end
    end
    return list
end

# for i in 0..24
#     game = Game.order('RANDOM()').first
#     game.sale = [0.25, 0.50, 0.75].sample
#     game.save
# end

# Status.find_or_create_by(name: "New")
# Status.find_or_create_by(name: "Paid")
# Status.find_or_create_by(name: "Shipped")

# Xbox One, Xbox Series S|X, PS4, PS5, Switch
# platforms = [49, 169, 48, 167, 130]

# require 'net/https'
# http = Net::HTTP.new('api.igdb.com',443)
# http.use_ssl = true
# # Iterating through all platforms to grab information
# platforms.each do |p|    
#     platform_request = Net::HTTP::Post.new(URI('https://api.igdb.com/v4/platforms'), {'Client-ID' => client_id, 'Authorization' => "Bearer #{access_token}"})
#     platform_request.body = "fields name, summary, platform_logo.image_id; where id = #{p};"    
#     platform_results = JSON.parse(http.request(platform_request).body)

#     # Adding the Platform to the Database
#     platform = Platform.find_or_create_by(name: platform_results[0]['name'])
#     if(!platform.price)
#         platform.price = Faker::Commerce.price(range: 199.99..699.99).round(2)
#     end
#     if(!platform.description)
#         if(platform_results[0]['summary'])
#             platform.description = platform_results[0]['summary']
#         else
#             platform.description = "No description available"
#         end       
#     end
#     image = URI.open("https://images.igdb.com/igdb/image/upload/t_logo_med/#{platform_results[0]['platform_logo']['image_id']}.png")
#     platform.image.attach(io: image, filename:"#{platform.name}.jpg")
#     platform.save    

#     # Grabbing first 5 games from platform
#     game_request = Net::HTTP::Post.new(URI('https://api.igdb.com/v4/games'), {'Client-ID' => client_id, 'Authorization' => "Bearer #{access_token}"})
#     game_request.body = "fields name, age_ratings.rating, genres.name, platforms.name, cover.image_id, summary; where release_dates.platform = #{p}; limit 20; offset #{platform.Games.count};"
#     game_results = JSON.parse(http.request(game_request).body)

#     # Looping through the games and adding them to the db
#     game_results.each do |g|
#         # Checking for the ESRB ratings only
#         game_rating = nil
#         # puts g['name']        
#         # puts g['age_ratings'].count()
#         if(g['age_ratings'])
#             g['age_ratings'].each do |rating|
#                 if(rating["rating"] == 8 || rating["rating"] == 10 || rating["rating"] == 11)
#                     game_rating = find_rating(rating["rating"])                    
#                 end
#             end  
#         end              
        
#         # Adding game to db
#         game = Game.find_or_create_by(name: g['name'])
#         game.price = Faker::Commerce.price(range: 59.99..89.99)
#         if(g['summary'])
#             game.description = g['summary']
#         else
#             game.description = "No summary available"
#         end            
#         game.age_rating = game_rating
#         game.save
#         if(g['cover'])
#             image = URI.open("https://images.igdb.com/igdb/image/upload/t_cover_big/#{g['cover']['image_id']}.jpg")
#             game.image.attach(io: image, filename:"#{game.name}.jpg")
#         end            

#         # Adding genre and platform join
#         if(g['genres'])
#             g['genres'].each do |genre|
#                 genre_name = genre['name']
#                 genre = Genre.find_or_create_by(name: genre_name)
#                 GameGenre.find_or_create_by(Game_id: game.id, Genre_id: genre.id)
#             end
#         end 

#         # Adding game and platform join
#         GamePlatform.find_or_create_by(Game_id: game.id, Platform_id: platform.id)
#     end
# end
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
