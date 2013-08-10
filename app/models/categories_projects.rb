class CategoriesProjects < ActiveRecord::Base
  attr_accessible :kick_category_id, :kick_project_id

  belongs_to :kick_category
  belongs_to :kick_project
end
