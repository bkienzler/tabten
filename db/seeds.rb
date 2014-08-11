# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

testUsers = Array["Ben", "Peter", "Klaus", "Harry", "Hans", "Franz", "Jürgen"]

testUsers.each do |username|
  User.find_or_create_by! :name => username, :email => username + "@gmail.com" do |user|
    user.sign_in_count = 0
    user.password = "12345678"
    user.password_confirmation = "12345678"
  end
end
    