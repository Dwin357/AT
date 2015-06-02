class SoldierAssignment < ActiveRecord::Base

  # t.integer :soldier_id
  # t.integer :dispatch_id
  # t.string  :role
  # t.boolean :out_wire, default: false
  # t.boolean :safe_return, default: false
      
  belongs_to :dispatch
  belongs_to :soldier
  # belongs_to :mission, through: :dispatch

  validates :dispatch, presence: true
  validates :soldier, presence: true 

  # I want to validate that a soldier is only appearing on a mission once
  # I want to validate that a soldier is not appearing on multiple overlapping missions



  def self.generate_assignment(params)
    soldier = Soldier.find_by_name(params[:name])
    self.new(soldier:   soldier, 
             role:     params[:role])
  end

  def self.assign_passengers(passengers)
    passengers.each do |assignment_params|
      Dispatch.add_passenger(assignment_params)
    end
  end

  def self.list_of_active_assignments
    # all.select{ &:out_wire && !&:safe_return}
    where(out_wire: true, safe_return: false)    
  end

  def leave_wire
    self.out_wire = true
    self.save
  end

  def has_returned
    safe_return = true
    self.save
  end

  # def active_time_range
  #   self.dispatch.active_time_range
  # end

  # def soldiers_future_assigment_time_ranges
  #   self.soldier.future_assignments
  # end

  # def overlaps_mission_time?
  #   self.soldiers_future_assigment_time_ranges.any? {|time_range| self.active_time_range.overlaps?(time_range) }
  # end

  # def check_availability
  #   if overlaps_mission_time?
  #     error.add(:soldier, "double booking")
  #   end
  # end

end
