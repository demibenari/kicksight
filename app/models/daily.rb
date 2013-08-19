class Daily < ActiveRecord::Base
  has_many :projects
  has_many :push_dates
end
