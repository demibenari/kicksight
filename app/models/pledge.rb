class Pledge < ActiveRecord::Base
  attr_accessible :delivery_date, :description, :id, :kick_project_id, :min_amount
end
