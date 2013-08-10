class Status < ActiveRecord::Base
  attr_accessible :description, :id

  belongs_to :kick_project
end
