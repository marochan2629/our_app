# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# メインのサンプル一般ユーザーを1人作成
User.create!(name: "Example User",
            email: "example@qwertyuiop.qwertyuiop",
            password:              "qwertyuiop",
            password_confirmation: "qwertyuiop")
             
# メインのサンプル施設ユーザーを1人作成
Facility.create!(name: "Example Facility",
             email: "manpower@qwertyuiop.qwertyuiop",
             phone_number: "0987654321",
             password:              "qwertyuiop",
             password_confirmation: "qwertyuiop")
             
# 追加の一般ユーザーをまとめて生成する
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password)
end

# 追加の施設管理ユーザーをまとめて生成する
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  phone_number = Faker::PhoneNumber.phone_number
  password = "password"
  Facility.create!(name:  name,
              email: email,
              phone_number: phone_number,
              password:              password,
              password_confirmation: password)
end 

