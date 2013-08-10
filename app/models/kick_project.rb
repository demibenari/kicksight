class KickProject < ActiveRecord::Base
  attr_accessible :expiration_date, :id, :kick_category_id, :name, :picture_link, :project_link, :status_id, :video_link
end
