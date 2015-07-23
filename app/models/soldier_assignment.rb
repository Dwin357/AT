class SoldierAssignment < ActiveRecord::Base

  # t.integer :soldier_id
  # t.integer :dispatch_id
  # t.string  :role
  # t.boolean :out_wire, default: false
  # t.boolean :safe_return, default: false

  belongs_to :dispatch
  belongs_to :soldier

  validates :dispatch, presence: true
  validates :soldier, presence: true


  validate :not_double_booked, on: :create
  validate :only_assigned_once, on: :create
    # for some reason this isn't failing when it should be... not sure why not





##########  v-validations  ##############

  def not_double_booked
    if overlaps_planned_mission_time?
      errors.add(:soldier_assignment, "soldier would be double booked")
    end
  end

  def only_assigned_once
    if already_assigned_to_mission?
      errors.add(:soldier_assignment, "soldier assigned to mission multiple times")
    end
  end

##########  v-class  ^-validations ########


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
    where(out_wire: true, safe_return: false)
  end



#########  ^-class  v-instance  ###########


  def leave_wire
    self.out_wire = true
    self.save
  end

  def has_returned
    self.safe_return = true
    self.save
  end

  def mission
    dispatch.mission
  end

  # syntax: time_range_1.overlaps?(time_range_2)=>t/f

  def active_time_window
    dispatch.active_time_window
  end

  def soldiers_unfinished_assigment_time_ranges
    soldier.unfinished_assignment_time_ranges
  end

  def overlaps_planned_mission_time?
    proposed_window = active_time_window
    soldiers_unfinished_assigment_time_ranges.any? do |time_range|
      proposed_window.overlaps?(time_range)
    end
  end

  def already_assigned_to_mission?
    soldiers_assigned_to_mission = mission.soldiers
    soldier = self.soldier
    soldiers_assigned_to_mission.any? do |soldier_on_mission|
      soldier == soldier_on_mission
    end
  end

end
