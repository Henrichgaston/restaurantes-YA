# require "open-uri"

# Food.destroy_all
# Restaurant.destroy_all
# User.destroy_all

# user1 = User.create!(
#   email: "fgiacchi89@gmail.com",
#   password: "123456"
# )
#   file = URI.open("https://avatars.githubusercontent.com/u/96851608?v=4")
#   user1.photo.attach(io: file, filename: "fran.png", content_type: "image/png")
#   user1.save

# user2 = User.create!(
#   email: "henrich@gmail.com",
#   password: "123456"
# )
#   file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1664024882/gzorjnohuxm9iednlx8j.jpg")
#   user2.photo.attach(io: file, filename: "gaston.png", content_type: "image/png")
#   user2.save

#   restaurant1 = Restaurant.create!(
#     name: "Don Julio",
#     address: "Segurola y Havana",
#     user_id: user1.id
#   )

#   restaurant2 = Restaurant.create!(
#     name: "La Parolaccia",
#     address: "Havana",
#     user_id: user1.id
#   )

#   restaurant3 = Restaurant.create!(
#     name: "El Preferido",
#     address: "Libertador",
#     user_id: user2.id
#   )

#   food1 = Food.create!(
#     name: "Milapo",
#     description: "Napolitana",
#     price: 10,
#     available: true,
#     restaurant_id: restaurant1.id
#   )

#   food2 = Food.create!(
#     name: "Ojo de bife",
#     description: "carne premium",
#     price: 15,
#     available: true,
#     restaurant_id: restaurant1.id
#   )

#   food3 = Food.create!(
#     name: "Pizza",
#     description: "Napolitana",
#     price: 9,
#     available: true,
#     restaurant_id: restaurant2.id
#   )

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
if Rails.env.development?
 puts "Deleting data"
 Food.destroy_all
 Schedule.destroy_all
 Restaurant.destroy_all
 User.destroy_all
 puts "Data deleted successfully"
end
puts "Creating users"
user1 = User.create!(name: "Francisco", address: "Av. Las Condes 345", email: "fgiacchi89@gmail.com", password:
"123456")
file = URI.open("https://avatars.githubusercontent.com/u/96851608?v=4")
user1.photo.attach(io: file, filename: "francisco.png", content_type: "image/png")
user1.save
puts "#{user1.name} created successfully"
user2 = User.create!(name: "Gaston", address: "Av. Las Condes 345", email: "henrich@gmail.com", password:
"123456")
file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1664024882/gzorjnohuxm9iednlx8j.jpg")
user2.photo.attach(io: file, filename: "gaston.png", content_type: "image/png")
user2.save
puts "#{user2.name} created successfully"
user3 = User.create!(name: "Fernando", address: "Av. Las Condes 345", email: "fernando@gmail.com", password:
"123456")
file = URI.open("https://avatars.githubusercontent.com/u/108149366?v=4")
user3.photo.attach(io: file, filename: "fdo.png", content_type: "image/png")
user3.save
puts "#{user3.name} created successfully"
puts "Creating restaurants"
restaurant1 = Restaurant.create!(name: "La carnecita roja y el lomo feroz", address: "Av. La Florida 3567",
specialty: "Carne asada", description: "La mejor carne asada de la ciudad, ven a disfrutar con nosotros todas la
variedades de platos", user: user1)
file = URI.open("https://www.eltiempo.com/files/image_640_428/uploads/2022/11/11/636ec9b036dfd.png")
restaurant1.photo.attach(io: file, filename: "r1.png", content_type: "image/png")
restaurant1.save
restaurant2 = Restaurant.create!(name: "Los tres cerditos al spiedo", address: "Av. Bernardo O'higgins 1267",
specialty: "Carnes premium", description: "Deleita a tu paladar con las mejores carnes premium de cerdo, vacuno
y guayu", user: user1)
file = URI.open("https://foodandpleasure.com/wp-content/uploads/2018/06/piantao-3.jpg")
restaurant2.photo.attach(io: file, filename: "r2.png", content_type: "image/png")
restaurant2.save
restaurant3 = Restaurant.create!(name: "  我是王- Yo soy wang ", address: "Av. Recoleta 3500,
Santiago", specialty: "Comida China", description: "Comida tradicional china cantonesa", user:
user2)
file = URI.open("https://c8.alamy.com/compes/c63f9h/luces-de-neon-y-faroles-rojos-en-la-noche-iluminando-menu-en-un-restaurante-chino-en-pekin-china-c63f9h.jpg")
restaurant3.photo.attach(io: file, filename: "r3.png", content_type: "image/png")
restaurant3.save
puts "Creating foods"

food = Food.create!(name: "Biffe chorizo", description: "Carne premium, asada al carbon", price: 14500, available:
true, restaurant: restaurant1)
file = URI.open("https://tofuu.getjusto.com/orioneat-prod-resized/ZQFHLTvwgTcfwd6nZ-1200-1200.webp")
food.photo.attach(io: file, filename: "f1.png", content_type: "image/png")
food.save
food = Food.create!(name: "Cerdo al spiedo", description: "Crujiente y sabrosa carne de cerdo cocinada a fuego
lento", price: 18500, available: true, restaurant: restaurant2)
file = URI.open("https://d1mm7fnxb6z2bq.cloudfront.net/media/images/spiedo1.height-500.jpg")
food.photo.attach(io: file, filename: "21.png", content_type: "image/png")
food.save
food = Food.create!(name: "Carne mongoliana", description: "Carne, cebollin, aji, soya y condimentos", price:
6500, available: true, restaurant: restaurant3)
file = URI.open("https://nutricionistarociosuarez.cl/wp-content/uploads/2018/08/chinese-satay-beef-106400-1-1300x867.jpeg")
food.photo.attach(io: file, filename: "21.png", content_type: "image/png")
food.save

# Crear Food #1
file1 = URI.open("https://d1mm7fnxb6z2bq.cloudfront.net/media/images/spiedo1.height-500.jpg")
food1 = Food.create!(name: "Carne mongoliana", description: "Carne, cebollin, aji, soya y condimentos", price: 6500, available: true, restaurant: restaurant3)
food1.photo.attach(io: file1, filename: "21.png", content_type: "image/png")
food1.save

# Crear Food #2
file2 = URI.open("https://cuk-it.com/wp-content/uploads/2020/05/thumb02-1-1024x576-2-1.jpg")
food2 = Food.create!(name: "Empanadas de carne", description: "Empanadas de carne con cebolla y aceitunas", price: 3000, available: true, restaurant: restaurant1)
food2.photo.attach(io: file2, filename: "22.png", content_type: "image/png")
food2.save

# Crear Food #3
file3 = URI.open("https://i.blogs.es/1cf6bd/milanesa-napolitana-min/1366_2000.jpeg")
food3 = Food.create!(name: "Milanesa napolitana", description: "Milanesa de ternera con salsa de tomate, jamón y queso", price: 8500, available: true, restaurant: restaurant2)
food3.photo.attach(io: file3, filename: "23.png", content_type: "image/png")
food3.save

# Crear Food #4
file4 = URI.open("https://cdn.shopify.com/s/files/1/0003/1916/0381/articles/asado-perfecto-1.jpg?v=1574172033")
food4 = Food.create!(name: "Asado", description: "Asado de tira con papas fritas y ensalada", price: 12500, available: true, restaurant: restaurant3)
food4.photo.attach(io: file4, filename: "24.png", content_type: "image/png")
food4.save

# Crear Food #5
file5 = URI.open("https://placeralplato.com/files/2016/01/Pizza-con-pepperoni-640x480.jpg?width=1200&enable=upscale")
food5 = Food.create!(name: "Pizza de pepperoni", description: "Pizza con salsa de tomate, queso y pepperoni", price: 7500, available: true, restaurant: restaurant1)
food5.photo.attach(io: file5, filename: "25.png", content_type: "image/png")
food5.save

# Crear Food #6
file6 = URI.open("https://content-cocina.lecturas.com/medio/2018/07/19/sushi-variado-tradicional_91be2c41_800x800.jpg")
food6 = Food.create!(name: "Sushi variado", description: "Sushi de salmón, atún, camarón y palta", price: 10500, available: true, restaurant: restaurant2)
food6.photo.attach(io: file6, filename: "26.png", content_type: "image/png")
food6.save
