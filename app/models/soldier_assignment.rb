class SoldierAssignment < ActiveRecord::Base
  belongs_to :dispatch
  belongs_to :soldier

  validates :mission, presence: true
  validates :soldier, presence: true, uniqueness: {scope: :mission}

  def self.create_roster(soldiers, role)
    soldiers.map do |soldier|
      self.create(soldier: Soldier.find_by_name(passenger["name"]))
    end
  end

  def generate_soldier
    soldier = Soldier.find_by_id(self.soldier)
    {soldier: soldier, returned: self.returned, passenger_id: self.id}
  end

  def leave_wire
    self.out_wire = true
    self.save
  end

  def safe_return
    self.returned = true
    self.save
  end

  def active_time_range
    self.dispatch.active_time_range
  end

  def soldiers_future_assigment_time_ranges
    self.soldier.future_assignments
  end

  def overlaps_mission_time?
    self.soldiers_future_assigment_time_ranges.any? {|time_range| self.active_time_range.overlaps?(time_range) }
  end

  def check_availability
    if overlaps_mission_time?
      error.add(:soldier, "double booking")
    end
  end

end
