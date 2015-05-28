class Passenger < ActiveRecord::Base
  belongs_to :mission
  belongs_to :soldier

  def self.create_passenger_list(passengers)
    passengers.map do |passenger|
      self.new(soldier: Soldier.find_by_name(passenger["name"]))
    end
  end

  def generate_soldier
    soldier = Soldier.find_by_id(self.soldier)
    {soldier: soldier, returned: self.returned, passenger_id: self.id}
  end

  def leave_wire
    self.out_wire = true
    self.save
    # if this gets wrapped in a transaction, chng sv to !
  end

  def safe_return
    self.returned = true
    self.save
  end

end
