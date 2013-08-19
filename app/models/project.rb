class Project < ActiveRecord::Base
  has_one :category
  has_one :status
  has_many :pledges
  has_many :dailies
  has_many :push_dates, :through => :dailies
end
