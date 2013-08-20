class Category < ActiveRecord::Base
  #belongs_to :project
  has_and_belongs_to_many :projects
  has_many :subcategories
end
