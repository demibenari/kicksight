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

Subcategory.create(description: 'Conceptual Art', category_id: Category.find_by_description('Art').id)
Subcategory.create(description: 'Crafts', category_id: Category.find_by_description('Art').id)
Subcategory.create(description: 'Digital Art', category_id: Category.find_by_description('Art').id)
Subcategory.create(description: 'Illustration', category_id: Category.find_by_description('Art').id)
Subcategory.create(description: 'Painting', category_id: Category.find_by_description('Art').id)
Subcategory.create(description: 'Performance Art', category_id: Category.find_by_description('Art').id)
Subcategory.create(description: 'Mixed Media', category_id: Category.find_by_description('Art').id)
Subcategory.create(description: 'Public Art', category_id: Category.find_by_description('Art').id)
Subcategory.create(description: 'Sculpture', category_id: Category.find_by_description('Art').id)

Subcategory.create(description: 'Graphic Design', category_id: Category.find_by_description('Design').id)
Subcategory.create(description: 'Product Design', category_id: Category.find_by_description('Design').id)

Subcategory.create(description: 'Animation', category_id: Category.find_by_description('Film & Video').id)
Subcategory.create(description: 'Documentary', category_id: Category.find_by_description('Film & Video').id)
Subcategory.create(description: 'Narrative Film', category_id: Category.find_by_description('Film & Video').id)
Subcategory.create(description: 'Short Film', category_id: Category.find_by_description('Film & Video').id)
Subcategory.create(description: 'Webseries', category_id: Category.find_by_description('Film & Video').id)

Subcategory.create(description: 'Tabletop Games', category_id: Category.find_by_description('Games').id)
Subcategory.create(description: 'Video Games', category_id: Category.find_by_description('Games').id)

Subcategory.create(description: 'Classical Music', category_id: Category.find_by_description('Music').id)
Subcategory.create(description: 'Country & Folk', category_id: Category.find_by_description('Music').id)
Subcategory.create(description: 'Electronic Music', category_id: Category.find_by_description('Music').id)
Subcategory.create(description: 'Hip-Hop', category_id: Category.find_by_description('Music').id)
Subcategory.create(description: 'Indie Rock', category_id: Category.find_by_description('Music').id)
Subcategory.create(description: 'Jazz', category_id: Category.find_by_description('Music').id)
Subcategory.create(description: 'Pop', category_id: Category.find_by_description('Music').id)
Subcategory.create(description: 'Rock', category_id: Category.find_by_description('Music').id)
Subcategory.create(description: 'World Music', category_id: Category.find_by_description('Music').id)

Subcategory.create(description: 'Art Book', category_id: Category.find_by_description('Publishing').id)
Subcategory.create(description: 'Children' 's Book', category_id: Category.find_by_description('Publishing').id)
Subcategory.create(description: 'Fiction', category_id: Category.find_by_description('Publishing').id)
Subcategory.create(description: 'Journalism', category_id: Category.find_by_description('Publishing').id)
Subcategory.create(description: 'Nonfiction', category_id: Category.find_by_description('Publishing').id)
Subcategory.create(description: 'Periodical', category_id: Category.find_by_description('Publishing').id)
Subcategory.create(description: 'Poetry', category_id: Category.find_by_description('Publishing').id)
Subcategory.create(description: 'Radio & Podcast', category_id: Category.find_by_description('Publishing').id)

Subcategory.create(description: 'Hardware', category_id: Category.find_by_description('Technology').id)
Subcategory.create(description: 'Open Software', category_id: Category.find_by_description('Technology').id)

c = Category.find_by_description('Art')
s = Status.find_by_description('Active')
p = Project.create(kick_id: 'p1', category_id: c.id, name: 'project1', expiration_date: '01.01.2014', status_id: s.id)
p1 = Pledge.create(project_id: p.id, min_amount: 5, description: 'bla bla bla 1', delivery_date: '01.02.2014')
dat = PushDate.create(push_date: Date.today())
Daily.create(pledge_id: p1.id, push_date_id: dat.id, amount_backers: 5, amount_pledged: 70)