class Category < ActiveRecord::Base
  belongs_to :project
  has_many :subcategories
end
