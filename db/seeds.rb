# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

testUsers = Array["ben", "peter", "klaus", "harry", "hans", "franz", "juergen"]

## add missing testUsers
testUsers.each do |username|
  User.find_or_create_by! :name => username do |user|
    user.ranking = testUsers.index(username) + 1
    user.email = username + "@gmail.com"
    user.sign_in_count = 0
    user.password = "12345678"
    user.password_confirmation = "12345678"
  end
end

## add missing rankings
insertedRankings = User.where.not({:ranking => nil}).pluck(:ranking)
allRankings = Array(1..User.count)
rankingsToInsert = allRankings - insertedRankings
User.where({:ranking => nil}).each do |user|  
  user.ranking = rankingsToInsert.shift
  user.save
end