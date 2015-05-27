class Dispatch < ActiveRecord::Base
  belongs_to  :truck
  belongs_to  :mission
  belongs_to  :driver, class_name: "Soldier"
  belongs_to  :a_driver, class_name: "Soldier"

  def self.check_out_truck(params)
    dispatch = self.new

    truck = Truck.find_by!(name: params[:truck_name])
    drivers = self.find_drivers([params[:driver_name], params[:a_driver_name]])
    dispatch.update_attributes(truck: truck, driver: drivers[0], a_driver: drivers[1])
    dispatch
  end

  def self.find_drivers(driver_names)
    driver_names.map {|driver| Soldier.find_by_name(driver)}
  end


end
