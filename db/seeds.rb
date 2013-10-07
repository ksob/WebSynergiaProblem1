# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
role = Role.create(name: 'Admin')
user = User.create(email: 'e@e.com', username: 'myusername', password: 'asdf')
role.assignments.create(user: user, role: role)
role = Role.create(name: 'User')
user.assignments.create(user: user, role: role)
role = Role.create(name: 'Other')
user = User.create(email: 'a@a.com', username: 'myusername2', password: 'asdf')
