# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
group = Group.create(name: 'Admin')
user = User.create(email: 'e@e.com', username: 'myusername', password: 'asdf')
group.assignments.create(user: user, group: group)
group = Group.create(name: 'User')
user.assignments.create(user: user, group: group)
group = Group.create(name: 'Other')
user = User.create(email: 'a@a.com', username: 'myusername2', password: 'asdf')
