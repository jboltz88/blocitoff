# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do 
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8)
  )
  user.skip_confirmation!
  user.save!
end

users = User.all

50.times do  
  Item.create!(
    name: Faker::Hipster.sentence,
    user: users.sample
  )
end

puts "Seed Data Created"
puts "#{User.count} users created"
puts "#{Item.count} to-do items created"