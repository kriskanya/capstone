# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = Fabricate(:user, name: "Joe Smith")
user2 = Fabricate(:user, name: "John Adams")
user3 = Fabricate(:user, name: "Ben Franklin")
user4 = Fabricate(:user, name: "Gouvernor Morris")
user5 = Fabricate(:user, name: "Sam Adams")
user6 = Fabricate(:user, name: "John Hancock")
user7 = Fabricate(:user, name: "Patrick Henry")
user8 = Fabricate(:user, name: "Henry Clay")

Fabricate(:course, user_id: user1.id, name: "Henry Clay")
