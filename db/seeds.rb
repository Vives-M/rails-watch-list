# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "json"
require "open-uri"
url = "https://tmdb.lewagon.com/movie/popular"

movies_serialized = URI.parse(url).read
movies = JSON.parse(movies_serialized)
movies_results = movies["results"]

puts "Cleaning database..."
Movie.destroy_all
List.destroy_all

puts "Retrieving movies..."

movies_results.each do |movie|
    Movie.create!(
    title: movie["original_title"],
    overview: movie["overview"],
    rating: movie["vote_average"],
    poster_url: movie["poster_path"],
    )
    puts "One movie retrieved !"
end

puts "#{Movie.count} movies created !"

# List.create!(
#   name: "Action"
#   photo: "cl_image_path 'app/assets/images/banner.webp', height: 300, crop: :fill"
# )

# List.create!(
#   name: "Romance"
# )

# puts "#{List.count} lists created"
