class PushDate < ActiveRecord::Base
  has_many :dailies
  has_many :pledges, :through => :dailies
end
