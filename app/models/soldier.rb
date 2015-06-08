class Soldier < ActiveRecord::Base

      # t.string  :name
      # t.string  :rank
      # t.string  :phone_number
      # t.string  :weapon_number
      # t.string  :weapon_serial
      # t.string  :cco_serial
      # t.integer :miles, default: 0

  has_many  :soldier_assignments
  has_many  :resource_statuses, as: :classification 
  
  has_many  :dispatches, through: :soldier_assignments
  has_many  :missions, through: :dispatches


  validates :name, presence: true
  validates :rank, presence: true


### v-class ####

  def self.avaliable
    all - SoldierAssignment.list_of_active_assignments.map{|sa| sa.soldier}
  end

  def self.build_display(soldier_id)
      troop= self.find_by_id(soldier_id)
    { soldier: troop,
      on_mission: troop.on_mission?,
      missions: troop.compile_missions
    }
  end

  ### ^- class  v-instance ####

  def update_miles(driven_miles)
  	self.miles += driven_miles
  	self.save
  end

  def list_missions
    missions
  end

  # def future_assignment_time_ranges
  # !!! a theoretical method
  #   self.mission_assignments.where(completed: false).map(&:active_time_range)
  # end

  def on_mission?
    self.soldier_assignments.where(safe_return: false, out_wire: true).any?
  end

  def compile_missions
    self.missions.map { |m|
      # dispatch = m.soldier_assignments.find_by(soldier: self).dispatch
      # dispatch.soldiers.find_by(role: "Driver").namerank
      { name: m.name,
        unit: m.unit_serviced,
        show_out_datetime: m.show_out_datetime
        # truck_name: dispatch.truck.name,
        # driver_namerank: "bob E4",
        # a_driver_namerank: "steve E5" 
      }
    }
  end

  def namerank
    "#{self.name} #{self.rank}"
  end

end
