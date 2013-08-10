class KickCategory < ActiveRecord::Base
  attr_accessible :description, :id

  has_many :categories_projectses
  has_many :kick_projects, through: :categories_projectses
end
