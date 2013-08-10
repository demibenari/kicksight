class DailyPledges < ActiveRecord::Base
  attr_accessible :amount_backers, :amount_pledged, :kick_project_id, :pledge_id, :push_date
end
