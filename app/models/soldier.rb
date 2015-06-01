class Soldier < ActiveRecord::Base
  has_many  :soldier_assignments
  has_many :resource_statuses, as: :classification 
  
  has_many  :dispatches, through: :soldier_assignments


# these are not doing what I expect and this is what I care about
  #has_many :missions, through: :passengers
  #has_many :missions, through: :dispatches


  # validates :name, presence: true
  # validates :rank, presence: true


  def update_miles(driven_miles)
  	miles += driven_miles
  	self.save
  end

  def list_missions
    missions
  end

  def future_assignment_time_ranges
    self.mission_assignments.where(completed: false).map(&:active_time_range)
  end

end
