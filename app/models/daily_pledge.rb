class DailyPledge < ActiveRecord::Base
  attr_accessible :amount_bakcers, :amount_pledges, :kick_project_id, :pledge_id, :push_date

  self.primary_keys :kick_project_id, :pledge_id

  belongs_to :pledge
end
