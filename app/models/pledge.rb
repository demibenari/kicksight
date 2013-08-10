require 'rubygems'
#require 'composite_primary_keys'

class Pledge < ActiveRecord::Base
  attr_accessible :id, :delivery_date, :description, :kick_project_id, :min_amount

#  self.primary_keys :kick_project_id, :id

  belongs_to :kick_project
  has_many :daily_pledges
end
