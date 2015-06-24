class Dispatch < ActiveRecord::Base
  # t.integer :truck_id
  # t.integer :mission_id
  # t.boolean :out_wire, default: false
  # t.boolean :safe_return, default: false
  # t.integer :miles_at_return
  # t.integer :miles_at_dispatch
  # t.integer :gallons_used
  # t.integer :oil_used

  belongs_to  :truck
  belongs_to  :mission
  has_many    :soldier_assignments
  has_many    :soldiers, through: :soldier_assignments
  has_many    :trailer_assignments
  has_many    :trailers, through: :trailer_assignments

  validates :truck, presence: true, uniqueness: {scope: :mission}, on: :create
  validates :mission, presence: true, on: :create
  validates :miles_at_dispatch, presence: true, on: :create

  validate :truck_not_double_booked, on: :create

  # validate :has_driver
  # validate :has_co_driver
    # b/c the dispatch is created on line 65 before soldiers are added, this fails
    # that said, I have a note inside the create method detailing the issue about
    # using Dispatch.new() and the problems with mission, soldier_assignment, and dispatch
    # all needing each other's IDs.


  # validate :moving_forward, on: :update
    # !!! for some reason this validation is preventing the dispatch from saving on update?!?  Don't know why


  #######  v- validations  ##############

  def has_driver
    # not in use b/c dispatch is created before soldier_assignment
    unless self.soldier_assignments.find_by(role: "Driver")
      errors.add(:soldier_assignments, "no driver")
    end
  end

  def has_co_driver
    # not in use b/c dispatch is created before soldier_assignment
    unless self.soldier_assignments.find_by(role: "A-Driver")
      errors.add(:soldier_assignments, "no co-driver")
    end
  end

  def moving_forward
    # not in use b/c this prevents ck-in for unkn reason
    if miles_at_return && miles_at_dispatch <= miles_at_return
      errors.add(:miles_at_return, "someone tampered with your odometer, check that shit")
    end
  end

  def truck_not_double_booked
    if overlaps_planned_mission_time?
      error.add(:truck, "truck would be double booked")
    end
  end



###############  ^-validations  v- class ###############
  def self.check_out_truck(params, mission_id)
    # ideally this would be 'dispatch=self.new' and then saved when the mission is saved
    # but doing such throws an error which seems to say that, "b/c soldierAssignment doesn't
    # have an association with mission, soldierAssignment can't depend upon mission.save to
    # hand it the dispatch.id which is generated as part of mission.save (which happens b/c
    # those two have a direct relationship)"...  The work around is to just create the dispatch
    # (so soldierAssignment can have the ID) and depend upon the fact that create mission is
    # wraped in a transaction which will roll-back everything if the mission doesn't go through,
    # ...but I still don't like it.
    truck = Truck.find_by!(name: params[:truck_name])
    dispatch = self.create!(truck:             truck,
                            miles_at_dispatch: truck.odometer,
                            mission_id: mission_id)

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
    tl= TrailerAssignment.generate_assignment({name: params[:trailer_name]})
    find_by(truck: Truck.find_by_name(params[:truck_name])).trailer_assignments << tl
  end


  def self.list_of_active_dispatches
    where(out_wire: true, safe_return: false)
  end


  def self.make_ck_in_display(params)
    find_by_id(params[:type_id]).generate_display_truck
  end


  ################ ^-class  v-instance  ###############

  def leave_wire
    update_attributes(out_wire: true)
  end

  def has_returned(params)
    # alt
    # Model.update(id, attr-1:value-1, attr-2:value-2...)
    # for multiple records param={ id-1 => {attr-1:value-1, ..},
    #                              id-2 => {attr-1:value-1, ..}}
    update_attributes(miles_at_return: params[:ending_miles],
                      safe_return: true)
    check_in_truck
    check_in_soldiers
  end

  def check_in_truck
    truck.update_attributes(odometer: miles_at_return)
  end


  def check_in_soldiers
    assignments = generate_crew_assignments
    close_crew_assignments(assignments)
    update_crew_miles(generate_crew(assignments))
  end

  def close_crew_assignments(crew_assignments)
    crew_assignments.each(&:has_returned)
  end

  def update_crew_miles(crew)
    driven_miles = generate_miles
    crew.each{|soldier| soldier.update_miles(driven_miles)}
  end

  def generate_crew_assignments
    [soldier_assignments.find_by(role: "Driver"),
     soldier_assignments.find_by(role: "A-Driver")]
  end


  def generate_crew(assignments)
    assignments.map{|crew| Soldier.find_by_id(crew)}
  end


  def generate_miles
    miles_at_return - miles_at_dispatch
  end

  def generate_display_truck
    {truck:         truck,
      driver:       soldier_assignments.find_by(role: "Driver").soldier,
      a_driver:     soldier_assignments.find_by(role: "A-Driver").soldier,
      passengers:   soldier_assignments.where(role: "Passenger").map(&:soldier),
      trailer:      trailer_assignments.map(&:trailer),
      out_wire:     self.out_wire,
      safe_return:  self.safe_return,
      dispatch_id:  self.id}
  end

  def active_time_window
    mission.active_time_window
  end

  def trucks_unfinished_dispatch_time_ranges
    truck.unfinished_dispatch_time_ranges
  end

  def overlaps_planned_mission_time?
    proposed_window = active_time_window
    trucks_unfinished_dispatch_time_ranges.any? do |time_range|
      proposed_window.overlaps?(time_range)
    end
  end





end
