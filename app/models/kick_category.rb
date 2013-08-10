class KickCategory < ActiveRecord::Base
  attr_accessible :description, :id

  has_many :cat_projects_rels
  has_many :kick_projects, through: :cat_projects_rels
end
