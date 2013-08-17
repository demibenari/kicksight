class Pledge < ActiveRecord::Base
  belongs_to :project
  has_many :dailies
  has_many :push_dates, :through => :dailies
end
