class KickProject < ActiveRecord::Base
  attr_accessible :expiration_date, :id, :name, :picture_link, :project_link, :status_id, :video_link

  has_one :status
  has_many :categories_projectses
  has_many :kick_categories, through: :categories_projectses
  has_many :pledges
end
