class Daily < ActiveRecord::Base
  has_many :pledges
  has_many :push_dates
end
