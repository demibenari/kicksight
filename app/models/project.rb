class Project < ActiveRecord::Base
  has_one :category
  has_one :status
  has_many :pledges
end
