class Project < ActiveRecord::Base
  belongs_to :category
  belongs_to :status
  has_many :pledges
  has_many :dailies
  has_many :push_dates, :through => :dailies


  #def as_json(options = nil)
  #   super(options)
  #super(options && {:include => { :category => {:only => :description}}, except: :category_id })
  #> @export_data.to_json(:include => { :modelb => { :only => :name }})

  #  end
end
