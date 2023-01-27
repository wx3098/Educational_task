# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create!(name: "管理者",
#              email: "admin@seed.com",
#              password: "987654",
#              password_confirmation: "987654",
#              admin: true)

User.create!(name: "管理者2",
             email: "test@seed.com",
             password: "654321",
             password_confirmation: "654321",
             admin: true)
