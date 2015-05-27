class Passenger < ActiveRecord::Base
  belongs_to :mission
  belongs_to :soldier

  def self.create_passenger_list(passengers)
    passengers.map do |passenger|
      self.new(soldier: Soldier.find_by_name(passenger["name"]))
    end
  end
end
