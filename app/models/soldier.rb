class Soldier < ActiveRecord::Base
  has_many  :soldier_assignments
  has_many  :resource_statuses, as: :classification 
  
  has_many  :dispatches, through: :soldier_assignments
  has_many  :missions, through: :dispatches


  validates :name, presence: true
  validates :rank, presence: true


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

  def self.avaliable
    all - SoldierAssignment.list_of_active_assignments.map{|sa| sa.soldier}
  end

end
