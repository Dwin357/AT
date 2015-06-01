class Dispatch < ActiveRecord::Base
  belongs_to  :truck
  belongs_to  :mission
  has_many    :soldier_assignments
  has_many    :soldiers, through: :soldier_assignments
  has_many    :trailer_assignments
  has_many    :trailers, through: :trailer_assignments

  validates :truck, presence: true, uniqueness: {scope: :mission}
  #validates :mission, presence: true
  validates :miles_at_dispatch, presence: true

  # validate :has_driver
  # validate :has_co_driver
  # validate :moving_forward, on: :update
  # validate :two_to_a_truck, on: :create

  # def has_driver
  #   if self.soldier_assignments.find_by(role: "Driver")
  #     errors.add(:soldier_assignments, "no driver")
  #   end
  # end

  # def has_co_driver
  #   if self.soldier_assignments.find_by(role: "A-Driver")
  #     errors.add(:soldier_assignments, "no co-driver")
  #   end
  # end

  # def two_to_a_truck
  #   if driver == a_driver
  #     errors.add(:a_driver, "need 2 to a truck")
  #   end
  # end

  # def moving_forward
  #   if miles_at_return && miles_at_dispatch <= miles_at_return
  #     errors.add(:miles_at_return, "someone tampered with your odometer, check that shit")
  #   end
  # end

  def self.check_out_truck(params)

    truck = Truck.find_by!(name: params[:truck_name])
    
    # ideally this would be 'dispatch=self.new' and then saved when the mission is saved
    # but doing such throws an error which seems to say that, "b/c soldierAssignment doesn't
    # have an association with mission, soldierAssignment can't depend upon mission.save to 
    # hand it the dispatch.id which is generated as part of mission.save (which happens b/c 
    # those two have a direct relationship)"...  The work around is to just create the dispatch
    # (so soldierAssignment can have the ID) and depend upon the fact that create mission is 
    # wraped in a transaction which will roll-back everything if the mission doesn't go through,
    # ...but I still don't like it.
    dispatch = self.create!(truck:             truck,
                            miles_at_dispatch: truck.odometer)

    driver = {name: params[:driver_name], role: "Driver"}
    dispatch.soldier_assignments << SoldierAssignment.generate_assignment(driver)

    co_driver = {name: params[:a_driver_name], role: "A-Driver"}
    dispatch.soldier_assignments << SoldierAssignment.generate_assignment(co_driver)

    dispatch
  end

  def self.add_passenger(params)
    tr= SoldierAssignment.generate_assignment({name:params[:passenger_name],role:"Passenger"})
    find_by(truck:Truck.find_by_name(params[:truck_name])).soldier_assignments << tr
  end

  def self.add_trailer(params)
    tl= TrailerAssignment.generate_assignment({name: params[:name]})
    find_by(truck: Truck.find_by_name(params[:truck_name])).trailer_assignments << tl
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

  # def generate_truck
  #   truck = Truck.find_by_id( self.truck )
  #   driver = Soldier.find_by_id( self.driver )
  #   a_driver = Soldier.find_by_id( self.a_driver )
  #   {truck:         truck,
  #     driver:       driver,
  #     a_driver:     a_driver,
  #     returned:     self.returned,
  #     dispatch_id:  self.id}
  # end

  # def active_time
  #   self.mission.active_time_window
  # end


end
