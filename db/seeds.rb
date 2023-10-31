# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "creating users"
User.create!(username: 'admin', password: '123456', role: 'admin')
User.create!(username: 'user', password: '123456')

puts "creating profiles"
name = Faker::FunnyName.name

Profile.create!(user_id: 1, username: name)
Profile.create!(user_id: 2, username: name)


puts "creating images"
Thumbnail.create!(set_name: 'base')
Thumbnail.last.images.attach(io: File.open("#{Rails.root}/app/assets/images/blank-profile-picture.png"), filename: 'placeholder.png', content_type: 'image/png')
Thumbnail.last.images.attach(io: File.open("#{Rails.root}/app/assets/images/warrior.png"), filename: 'warrior', content_type: 'image/png')
