Truck.create(name: "E2", model: "HMV")
Truck.create(name: "E3", model: "HMV")
Truck.create(name: "E41", model: "LHS")
Truck.create(name: "E52", model: "LMTV")
Truck.create(name: "E53", model: "LMTV")
Truck.create(name: "E54", model: "LMTV")

Soldier.create(name: "Steinmetz", phone_number: "630.880.8271", rank: "e4")
Soldier.create(name: "Sosebe",  rank: "e4")
Soldier.create(name: "Ramierez", rank: "e4")
Soldier.create(name: "Wojo", rank: "e4")
Soldier.create(name: "Smith", rank: "e5")
Soldier.create(name: "West", rank: "e5")
Soldier.create(name: "Avelia", rank: "e6")
Soldier.create(name: "Lynch", rank: "e5")
Soldier.create(name: "Dean", rank: "e4")
Soldier.create(name: "Cortez", rank: "e4")
Soldier.create(name: "Prado", rank: "e4")
Soldier.create(name: "Williams", rank: "e5")
Soldier.create(name: "Young", rank: "e4")
Soldier.create(name: "Reyes", rank: "e5")
Soldier.create(name: "Scrogins", rank: "e6")
Soldier.create(name: "Wire", rank: "e8")
Soldier.create(name: "Bennet", rank: "o2")
Soldier.create(name: "Winn", rank: "03")
Soldier.create(name: "Shoults", rank: "e4")
Soldier.create(name: "Mirrevete", rank: "e4")

Trailer.create(name: "TL100")
Trailer.create(name: "TL102")

		
units = ["Alpha", "Bravo", "Charlie", "Delta", "Golf", "HHC"]
example_missions = ["Chow", "TrX", "Ammo", "RR"]

5.times do
	soldier_list = Soldier.all
  truck_list = Truck.all 

  mission = Mission.new
  mission.step_off      = Time::now
  mission.return        = Time::now
  mission.name          = example_missions.sample
  mission.unit_serviced = units.sample

  dispatches = []
  2.times do 
  	truck = truck_list.shuffle.pop
    driver = soldier_list.shuffle.pop
    a_driver = soldier_list.shuffle.pop
    dispatches << Dispatch.create!(truck: truck, driver_id: driver.id,
      a_driver_id: a_driver.id)
  end
  mission.dispatches = dispatches

  passenger_list = []
  3.times do
  	passenger_list << Passenger.create!(soldier: soldier_list.shuffle.pop)
  end
  mission.passengers = passenger_list
 
  mission.save!
end


