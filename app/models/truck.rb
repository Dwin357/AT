class Truck < ActiveRecord::Base
  # t.string  :name   #G3
  # t.string  :model    #LMTV
  # t.string  :radio_NSN  # sensitive item serial number
  # t.integer :odometer

  has_many :deficiencies, as: :breakable
  has_many :payloads, as: :loadable
  has_many :resource_statuses, as: :classification
  has_many :dispatches
  has_many :missions, through: :dispatches

  validates :name, presence: true
  validates :model, presence: true
  validates :odometer, presence: true

### v-class ####

  def self.available
    all.reject(&:on_mission?)
  end

  def self.build_index_display
    self.all.map{ |truck|
      {name_model:     truck.name_model,
       id:             truck.id,
       odometer:       truck.odometer,
       mission_count:  truck.missions.count,
       availible:      truck.availibility_display
      }
    }
  end

  def self.build_display(truck_id)
    tk = self.find_by_id(truck_id)
     {truck: tk,
      on_mission: tk.on_mission?,
      missions: tk.compile_missions
    }

  end

### ^- class  v-instance ####

  def unfinished_dispatch_time_ranges
    dispatches.where(safe_return: false).map(&:active_time_window)
  end

  def on_mission?
    dispatches.where(safe_return: false, out_wire: true).any?
  end

  def name_model
    "#{name} #{model}"
  end

  def availibility_display
    on_mission? ? 'On Mission' : 'Availible'
  end

  def compile_missions
    self.missions.map do |m|
      dispatch = m.dispatches.find_by(truck: self)
       {id: m.id,
        name: m.name,
        unit: m.unit_serviced,
        show_out_datetime: m.show_out_datetime,
        truck_name: self.name,
        driver_namerank: dispatch.soldier_assignments.find_by(role: "Driver").soldier.namerank,
        a_driver_namerank: dispatch.soldier_assignments.find_by(role: "A-Driver").soldier.namerank,
      }
    end
  end





end
