class Dispatch < ActiveRecord::Base
  belongs_to  :truck
  belongs_to  :mission
  # belongs_to  :driver, class_name: "Soldier"
  # belongs_to  :a_driver, class_name: "Soldier"
  has_many :soldiers, through: :soldier_assignment

  validates :truck, presence: true, uniqueness: {scope: :mission}
  validates :mission, presence: true
  validates :driver, presence: true, uniqueness: {scope: :mission}
  validates :a_driver, presence: true, uniqueness: {scope: :mission}
  validates :miles_at_dispatch, presence: true

  validate :moving_forward, on: :update
  # validate :two_to_a_truck, on: :create

  def two_to_a_truck
    if driver == a_driver
      errors.add(:a_driver, "need 2 to a truck")
    end
  end

  def moving_forward
    if miles_at_return && miles_at_dispatch < miles_at_return
      errors.add(:miles_at_return, "someone tampered with your odometer, check that shit")
    end
  end

  def self.check_out_truck(params)
    dispatch = self.new

    truck = Truck.find_by!(name: params[:truck_name])
    drivers = self.find_drivers([params[:driver_name], params[:a_driver_name]])
    dispatch.update_attributes(truck: truck,
                              driver: drivers[0],
                              a_driver: drivers[1],
                              miles_at_dispatch: truck.odometer)
    dispatch
  end

  def self.find_drivers(driver_names)
    driver_names.map {|driver| Soldier.find_by_name(driver)}
  end

  def leave_wire
    self.out_wire = true
    self.save
  end

  def safe_return#(params[:ck_in_tk])
    # self.check_in_truck(params)
    self.returned = true
    self.save
  end

  # def check_in_truck(params)
  #   # to be flipped on when able to gather data at tk ck in
  #   miles_at_return = params[:miles]
  #   self.save

  #   driven_miles = miles_at_return - miles_at_dispatch
  #   Soldier.find_by_id(self.driver).update_miles(driven_miles)
  #   Soldier.find_by_id(self.a_driver).update_miles(driven_miles)
  # end

  def generate_truck
    truck = Truck.find_by_id( self.truck )
    driver = Soldier.find_by_id( self.driver )
    a_driver = Soldier.find_by_id( self.a_driver )
    {truck:         truck,
      driver:       driver,
      a_driver:     a_driver,
      returned:     self.returned,
      dispatch_id:  self.id}
  end

  def active_time
    self.mission.active_time_window
  end


end
