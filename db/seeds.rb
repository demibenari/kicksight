# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Status.create(description: 'Active')
Status.create(description: 'Archived')
Status.create(description: 'Manually Archived')

Category.create(description: 'Art')
Category.create(description: 'Comics')
Category.create(description: 'Dance')
Category.create(description: 'Design')
Category.create(description: 'Fashion')
Category.create(description: 'Film & Video')
Category.create(description: 'Food')
Category.create(description: 'Games')
Category.create(description: 'Music')
Category.create(description: 'Photography')
Category.create(description: 'Publishing')
Category.create(description: 'Technology')
Category.create(description: 'Theater')
Category.create(description: 'Unidentified')