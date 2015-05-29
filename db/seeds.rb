Truck.create(name: "E2", model: "HMV", odometer: 48546)
Truck.create(name: "E3", model: "HMV", odometer: 9783)
Truck.create(name: "E41", model: "LHS", odometer: 6545)
Truck.create(name: "E43", model: "LHS", odometer: 6645)
Truck.create(name: "E44", model: "LHS", odometer: 6985)
Truck.create(name: "E52", model: "LMTV", odometer: 25635)
Truck.create(name: "E53", model: "LMTV", odometer: 36756)
Truck.create(name: "E54", model: "LMTV", odometer: 46456)
Truck.create(name: "E55", model: "LMTV", odometer: 46456)
Truck.create(name: "E56", model: "LMTV", odometer: 46456)
Truck.create(name: "E57", model: "LMTV", odometer: 46456)

Soldier.create(name: "Steinmetz", phone_number: "630.880.8271", rank: "e4")
Soldier.create(name: "Sosebe",  rank: "e4")
Soldier.create(name: "Ramierez", rank: "e4")
Soldier.create(name: "Wojo", rank: "e4")
Soldier.create(name: "Smith", rank: "e5")
Soldier.create(name: "West", rank: "e5")
Soldier.create(name: "Avelia", rank: "e6")
Soldier.create(name: "Lynch", rank: "e5")
# Soldier.create(name: "Dean", rank: "e4")
# Soldier.create(name: "Cortez", rank: "e4")
# Soldier.create(name: "Prado", rank: "e4")
# Soldier.create(name: "Williams", rank: "e5")
# Soldier.create(name: "Young", rank: "e4")
# Soldier.create(name: "Reyes", rank: "e5")
# Soldier.create(name: "Scrogins", rank: "e6")
# Soldier.create(name: "Wire", rank: "e8")
# Soldier.create(name: "Bennet", rank: "o2")
# Soldier.create(name: "Winn", rank: "03")
# Soldier.create(name: "Shoults", rank: "e4")
# Soldier.create(name: "Mirrevete", rank: "e4")

Trailer.create(name: "TL100")
Trailer.create(name: "TL102")
Trailer.create(name: "TL106")


units = ["Alpha", "Bravo", "Charlie", "Delta", "Golf", "HHC"]
example_missions = ["Chow", "TrX", "Ammo", "RR"]

# # 5.times do
# # 	soldier_list = Soldier.all
# #   truck_list = Truck.all
# #   trailer_list = Trailer.all
# #   mission_params = {
#     mission: {step_off_date: Time.now.strftime("%Y-%m-%d"),
#               step_off_time:  Time.now.strftime("%H:%M"),
#               return_date:    Time.now.strftime("%Y-%m-%d"),
#               return_time:    Time.now.strftime("%H:%M"),
#               name:           example_missions.sample,
#               unit_serviced:  units.sample },


#     trailers: [{"trailer_name" => trailer_list.shuffle.pop.name,
#                 "truck_name" =>   truck_list.sample.name},

#                 {"trailer_name" => trailer_list.shuffle.pop.name,
#                 "truck_name" =>   truck_list.sample.name},

#                 {"trailer_name" => trailer_list.shuffle.pop.name,
#                 "truck_name" =>   truck_list.sample.name}],


#     payloads: [{vehicle_name: truck_list.sample.name,
#                 payload: "Stuff and Things and more Stuff"},

#                 {vehicle_name: trailer_list.sample.name,
#                  payload: "Peas and ^, they are more important than you think"}],


#     trucks: [ {truck_name:     truck_list.shuffle.pop.name,
#                 # driver_name:   soldier_list.shuffle.pop.name,
#                 # a_driver_name: soldier_list.shuffle.pop.name },

#                 {truck_name:   truck_list.shuffle.pop.name,
#                  # driver_name:   soldier_list.shuffle.pop.name,
#                  # a_driver_name: soldier_list.shuffle.pop.name } ],


#     # passengers: [{"name" => soldier_list.shuffle.pop.name},
#     #              {"name" => soldier_list.shuffle.pop.name},
#     #              {"name" => soldier_list.shuffle.pop.name} ]

#     soldier_assignment: [ {soldier_name:  }

  #   ]
  # }
#   Mission.create_new(mission_params)
# end
5.times do
  trucks = Truck.all
  mission = Mission.new

  mission.step_off_at = Time.now
  mission.return_at = Time.now
  mission.name  =         example_missions.sample
  mission.unit_serviced = units.sample

  soldiers = Soldier.all
  (1..3).to_a.sample.times do
    dispatch = mission.dispatches.build
    dispatch.truck = trucks.shuffle.pop
    (2..5).to_a.sample.times do |i|
      roles = ["driver", "a_driver"] << "passenger" * 3
      assignment = dispatch.soldier_assignment.build
      assignment.soldier = soldiers.shuffle.pop
      assignment.role = roles.shift
    end
  end
  mission.save
end
