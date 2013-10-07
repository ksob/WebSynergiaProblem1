# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
role = Role.create(name: 'Admin')
user = User.create(email: 'myemail', username: 'myusername', password: 'mypassword')
role.assignments.create(user: user, role: role)
Role.create(name: 'User')