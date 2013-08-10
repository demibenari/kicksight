require 'rubygems'
#require 'composite_primary_keys'

class DailyPledge < ActiveRecord::Base
  attr_accessible :pledge_id, :amount_bakcers, :amount_pledges,  :push_date

#  self.primary_keys  :pledge_id, :push_date

  belongs_to :pledge
end
