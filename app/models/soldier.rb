class Soldier < ActiveRecord::Base

  # t.string  :name
  # t.string  :rank
  # t.string  :phone_number
  # t.string  :weapon_number
  # t.integer :miles, default: 0

  has_many  :soldier_assignments
  has_many  :resource_statuses, as: :classification 
  
  has_many  :dispatches, through: :soldier_assignments
  has_many  :missions, through: :dispatches


  validates :name, presence: true
  validates :rank, presence: true


  def update_miles(driven_miles)
  	self.miles += driven_miles
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
