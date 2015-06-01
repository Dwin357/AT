class Mission < ActiveRecord::Base
  has_many :rest_points
  has_many :dispatches
  has_many :trailer_dispatches

  has_many :trucks, through: :dispatches
  has_many :trailers, through: :trailer_dispatches
  has_many :soldier_assignments, through: :dispatches

  has_many :soldiers, through: :soldier_assignments

  #these are not doing what I am expecting...
  # has_many :soldiers, through: :dispatches, source: :driver
  # has_many :soldiers, through: :dispatches, source: :a_driver
  # has_many :soldiers, through: :passengers

  validates :name, presence: true
  validates :unit_serviced, presence: true

  validates :step_off_at, presence: true
  validates :return_at, presence: true

  validate  :no_time_travel


  def no_time_travel
    if return_at < step_off_at
      errors.add(:return_at, "Returning before you left?!?")
    end
  end


  def self.create_new(params)
    self.transaction do

      mission = self.create!(
      step_off_at:  "#{params[:mission][:step_off_date]+" "+params[:mission][:step_off_time]+":00"}",
      return_at:    "#{params[:mission][:return_date]} #{params[:mission][:return_time]}:00",
      name:          params[:mission][:name],
      unit_serviced: params[:mission][:unit_serviced])

      mission.dispatches << self.set_up_dispatches(params[:trucks])
      mission.trailer_dispatches << self.set_up_trailer_dispatches(params[:trailers])

      SoldierAssignment.set_up_roster(params[:passengers]) if params[:passengers]
      Payload.assign_payloads(params[:payloads]) if params[:payloads]

      mission.save!
    end
  end

  # !!! this is something to be refactored later, after the site is working
  # def self.resources(option)
  #   case option
  #   when :all
  #     build "resource object" w/ all resources listed
  #   when :avaliable
  #     build "resource object" w/ only avaliable resources listed
  #   end
  # end



  def self.set_up_dispatches(trucks)
    trucks.map do |dispatch_params|
      Dispatch.check_out_truck(dispatch_params)
    end
  end


  def self.set_up_trailer_dispatches(trailers)
    return [] unless !!trailers
    TrailerDispatch.check_out_trailer(trailers)
  end

  def self.unresolved_missions
    missions = Hash.new
    unresolved = self.uncompleted.sort_by{|mission| mission.step_off_at}.group_by {|mission| mission.initiated}
    missions[:uninitiated] = unresolved[false]
    missions[:initiated] = unresolved[true]
    missions
  end

  def self.uncompleted
    self.where(completed: false)
  end

  def self.active
    self.where(completed: false, out_wire: true)
  end


############################### ^-class  v-instance ##############

  def show_out_datetime
    step_off_at.strftime("%H:%M::%m/%d")
  end

  def show_return_datetime
    self.return_at.strftime("%H:%M::%m/%d")
  end

  def leave_wire
      self.initiated = true
      self.save
      mission_resources.each do |resource|
        resource.leave_wire
      end
  end

  # def generate_display
  #   trucks = self.dispatches.map{ |d| d.generate_truck }
  #   soldiers = self.passengers.map{ |p| p.generate_soldier }
  #   trailers = self.trailer_dispatches.map{ |td| td.generate_trailer }
  #   {mission: self, trucks: trucks, soldiers: soldiers, trailers: trailers}
  # end

  def accountability_check
    if mission_resources.all?(&:returned)
      self.completed = true
      self.save
    end
  end

  def mission_resources
    dispatches + soldier_assignments + trailer_dispatches
  end

  # def active_time_window
  #   (self.step_off_at..self.return_at)
  # end
end
