class Project < ActiveRecord::Base
  belongs_to :category
  belongs_to :status
  has_many :pledges
  has_many :dailies
  has_many :push_dates, :through => :dailies

  def as_json(options = { })
    h = super(options)

    current_pledged = Daily.where(project_id: id)
    last_daily = current_pledged.last()

    if (!last_daily.nil?)
      h[:current]   = last_daily.read_attribute('amount_pledged')
    else
      puts 'The kick id of the bad project is: ' + kick_id
    end
    h
end
end
