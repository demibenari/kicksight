require 'rubygems'
require 'composite_primary_keys'

class Pledge < ActiveRecord::Base
  attr_accessible :delivery_date, :description, :id, :kick_project_id, :min_amount

  self.primary_keys :kick_project_id, :id

  belongs_to :kick_project
  has_many :daily_pledges
end
