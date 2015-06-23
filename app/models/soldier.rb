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
    self.all.map{ |soldier|
      { namerank: soldier.namerank,
         mission_count: soldier.missions.count,
         available: soldier.availibility_display,
         last_assignment: soldier.last_assignment_return_time,
         id: soldier.id
      }
    }
  end

  def self.available
    all.reject(&:on_mission?)
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
    # this seems like it should be two methods, 
    # a "last_mission" and a "updated_at.strft"
    # the trouble I run into is that  I end up calling "updated_at.strft" on 
    # the string "No Mission" if I break it into two methods.
    if last_mission = soldier_assignments.where(safe_return: true).last
      last_mission.updated_at.strftime("%H:%M::%m/%d")
    else
      "No Missions"
    end
  end

  def availibility_display
    on_mission? ? 'On Mission' : 'Availible'
  end

  def update_miles(driven_miles)
  	self.miles += driven_miles
  	self.save
  end

  def list_missions
    missions
  end

  def unfinished_assignment_time_ranges
    soldier_assignments.where(safe_return: false).map(&:active_time_window)
  end

  def on_mission?
    self.soldier_assignments.where(safe_return: false, out_wire: true).any?
  end

  def compile_missions
    self.missions.map do |m|
      dispatch = m.soldier_assignments.find_by(soldier: self).dispatch
      { id: m.id,
        name: m.name,
        unit: m.unit_serviced,
        show_out_datetime: m.show_out_datetime,
        truck_name: dispatch.truck.name,
        driver_namerank: dispatch.soldier_assignments.find_by(role: "Driver").soldier.namerank,
        a_driver_namerank: dispatch.soldier_assignments.find_by(role: "A-Driver").soldier.namerank 
      }
    end
  end

  def namerank
    "#{self.name} #{self.rank}"
  end

end
