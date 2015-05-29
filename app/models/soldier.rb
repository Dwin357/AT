class Soldier < ActiveRecord::Base
  has_many  :dispatches
  has_many  :passengers
  has_many :resource_statuses, as: :classification

# these are not doing what I expect
  #has_many :missions, through: :passengers
  #has_many :missions, through: :dispatches


  validates :name, presence: true
  validates :rank, presence: true


  def update_miles(driven_miles)
  	miles += driven_miles
  	self.save
  end

  def list_missions
    missions
  end

end
