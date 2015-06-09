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

  def self.build_index_display
    # needs to hand back an ary of display objects
    self.all.map{ |troop|
      { namerank: troop.namerank,
         mission_count: troop.missions.count,
         availible: troop.avalibility_display,
         last_assignment: troop.last_assignment_return_time,
         id: troop.id}
    }
  end

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

  def last_assignment_return_time
    # this is two methods, a "last_mission" and a "updated_at.strft"
    # the trouble I run into is that I don't know how to handle the 
    # "No Missions" sudo~error
    if last_mission = soldier_assignments.where(safe_return: true).last
      last_mission.updated_at.strftime("%H:%M::%m/%d")
    else
      "No Missions"
    end
  end

  def avalibility_display
    on_mission? ? 'On Mission' : 'Avaliable'
  end

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
      dispatch = m.soldier_assignments.find_by(soldier: self).dispatch
      # dispatch
      { id: m.id,
        name: m.name,
        unit: m.unit_serviced,
        show_out_datetime: m.show_out_datetime,
        truck_name: dispatch.truck.name,
        driver_namerank: dispatch.soldier_assignments.find_by(role: "Driver").soldier.namerank,
        a_driver_namerank: dispatch.soldier_assignments.find_by(role: "A-Driver").soldier.namerank 
      }
    }
  end

  def namerank
    "#{self.name} #{self.rank}"
  end

end
