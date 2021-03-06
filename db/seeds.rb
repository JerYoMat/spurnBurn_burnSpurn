# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "test user",
  email: "test@test.com",
  password:              "password",
  password_confirmation: "password")


100.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@testusers.org"
    password = "password"
    User.create!(name:  name,
                 email: email,
                 password:              password,
                 password_confirmation: password)
  end
  
  
  #create! is the same as create except that it raises an exception for an invalid user rather than returning false. 
  

  
  lesson_names = ["Ruby Basics", "Git and Github", "OO Ruby", "SQL", "ORM and ActiveRecord", "Rack and Middleware", "Sinatra", "Rails", "Javascript Basics", "Working with DOM", "CSS"]
  
  index = 0 
  while (index < lesson_names.length)
    fake_content = Faker::Lorem.paragraph(sentence_count = 5, supplemental = false, random_sentences_to_add = 0).split('.')
    name = lesson_names[index]
    Lesson.create!(
              name: name)
    index+=1
  end 
  
  
  
  users = User.order(:created_at).take(6)
  50.times do
    title = Faker::Lorem.sentence(2)
    description = Faker::Lorem.sentence(5)
    link = Faker::Internet.url
    lesson = "Rails"
    users.each { |user| user.tips.create!(
      title: title,
      description: description,
      link: link,
      lesson_id: rand(1..11)) }
  end