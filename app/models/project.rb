class Project < ActiveRecord::Base
  belongs_to :category
  belongs_to :status
  has_many :pledges
  has_many :dailies
  has_many :push_dates, :through => :dailies


end
