class PushDate < ActiveRecord::Base
  has_many :dailies
  has_many :projects, :through => :dailies
end
