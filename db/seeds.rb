# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'rest-client' 


Movie.destroy_all
# User.destroy_all
Favorite.destroy_all

movies = RestClient.get('https://comicvine.gamespot.com/api/movies/?api_key=1bc3aaafa2e58de60dce5a3f1b73c8f995e8b254&format=json&limit=200')

movie_array = JSON.parse(movies)["results"] 


movie_array.each do |movie|
    
    Movie.create(
        budget: movie["budget"],
        image_url: movie["image"]["medium_url"],
        box_office_revenue:movie["box_office_revenue"] ,
        description: movie["description"],
        name: movie["name"],
        rating: movie["rating"],
        runtime: movie["runtime"]
    )

end 


will = User.create(username: "wdrougas", profile_photo: 'https://mandiokateam.com/sports-buddy/profile/Will.jpg')
jose = User.create(username: "jromero" , profile_photo: 'https://mandiokateam.com/sports-buddy/profile/Jose.jpg')
trevor = User.create(username: "tjameson" , profile_photo: 'https://mandiokateam.com/sports-buddy/profile/Trevor.jpg')
chine = User.create(username: "canikwe" , profile_photo: 'https://mandiokateam.com/sports-buddy/profile/Chine.jpg')
sara = User.create(username: "ssmith" , profile_photo: 'https://mandiokateam.com/sports-buddy/profile/Sara.jpg')
kyle = User.create(username: "cakehole" , profile_photo: 'https://mandiokateam.com/sports-buddy/profile/Kyle.jpg')
jasur = User.create(username: "jabdullin" , profile_photo: 'https://mandiokateam.com/sports-buddy/profile/Jasur.jpg')
matt = User.create(username: "mbechtel" , profile_photo: 'https://mandiokateam.com/sports-buddy/profile/MattB.jpg')
rob = User.create(username: "rheavner" , profile_photo: 'https://mandiokateam.com/sports-buddy/profile/Matt.jpg')
ryan = User.create(username: "rsmith" , profile_photo: 'https://mandiokateam.com/sports-buddy/profile/Ryan.jpg')
remi = User.create(username: "rremi" , profile_photo: 'https://mandiokateam.com/sports-buddy/profile/Remi.jpg')
sebastian = User.create(username: "ssebastian", profile_photo: 'https://mandiokateam.com/sports-buddy/profile/Sebastian.jpg')
young = User.create(username: "yhan", profile_photo: 'https://mandiokateam.com/sports-buddy/profile/Young.jpg')
