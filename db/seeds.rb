require "open-uri"

Food.destroy_all
Restaurant.destroy_all
User.destroy_all

user1 = User.create!(
  email: "fgiacchi89@gmail.com",
  password: "123456"
)
  file = URI.open("https://avatars.githubusercontent.com/u/96851608?v=4")
  user1.photo.attach(io: file, filename: "fran.png", content_type: "image/png")
  user1.save

user2 = User.create!(
  email: "henrich@gmail.com",
  password: "123456"
)
  file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1664024882/gzorjnohuxm9iednlx8j.jpg")
  user2.photo.attach(io: file, filename: "gaston.png", content_type: "image/png")
  user2.save

  restaurant1 = Restaurant.create!(
    name: "Don Julio",
    address: "Segurola y Havana",
    user_id: user1.id
  )

  restaurant2 = Restaurant.create!(
    name: "La Parolaccia",
    address: "Havana",
    user_id: user1.id
  )

  restaurant3 = Restaurant.create!(
    name: "El Preferido",
    address: "Libertador",
    user_id: user2.id
  )

  food1 = Food.create!(
    name: "Milapo",
    description: "Napolitana",
    price: 10,
    available: true,
    restaurant_id: restaurant1.id
  )

  food2 = Food.create!(
    name: "Ojo de bife",
    description: "carne premium",
    price: 15,
    available: true,
    restaurant_id: restaurant1.id
  )

  food3 = Food.create!(
    name: "Pizza",
    description: "Napolitana",
    price: 9,
    available: true,
    restaurant_id: restaurant2.id
  )

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
