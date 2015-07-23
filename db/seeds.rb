# l;[SP - 0800 6/4/15, ck2
# G9 tenard, cortez, piveral
# G12 miravete dean
# G33 Lescaie, holt
# G30 Boege, benette
# G35 West, gavina
# G36 Gutierrez, Marrero
# G37(tk1) Smith, Maloney

# Name, grade, wep_serial, wep_num, cco_serial, tk_up, phone
# Cortez, e4, W487221, E15, K2089174, G09
# Holt, e2, 182391, saw, saw, G33




# SSG       SHERMAN, THOMAS
# SGT 	WEST, EDWARD	E23	W487674	K2091054			G35
# SGT 	MARRERO, ALEJANDRO		W487640	K2091048			G36
# SGT 	SMITH, DEREK
# SPC	PRADO, RICHARD
# SPC	PINTOR, EDUARDO
# PFC	LOEZA, LUIS
# PFC	ARANDA, ANDREW
# 	SPC	STEINMETZ, EDWIN	E38	W511819	K2093538			G01
# 	SPC	MALONEY, ANTHONY	E32	W509735	K2091154			G37
# 	PFC	PIVARAL, JONATHAN	E29	W508993	K2091145			G09
# 	SPC	MIRAVETE/LEAL, ALEXANDRA	E24	W499022	K2091132			G12
# 	PFC	DEAN, JASMINE E16	W487244	K2001381			G12
# 	SPC	LESCAIE, FLORIN	E33	W509938	K2093639			G33
# 	PV2	HOLT, ANTHONY	saw	182391	saw			G33
# 	SPC	BOEGE, MICHAEL	saw	182395	saw			G02
# 	SPC	GAVINA, JOAQUIN	E31	W509543	K2091149			G35
# 	SPC	GUTIERREZ, ARMANDO	E21	W487491	K2091034			G36
# 	SPC	CORTEZ, MIGUEL	E15	W487221	K2089174			G09
# 	SPC	CRESPO, NIKKO	saw	182037	saw
# PFC	TENARD, TOESHA	E39	W511821	K2093544			G02
# LT	BENNETT, MICAH	E14	W487217	K2089173			G30

Mission.destroy_all if Mission.all.length > 1

Soldier.destroy_all if Soldier.all.length > 1
SoldierAssignment.destroy_all if SoldierAssignment.all.length > 1

Truck.destroy_all if Truck.all.length > 1
Dispatch.destroy_all if Dispatch.all.length > 1

Payload.destroy_all if Payload.all.length > 1



Soldier.create!(name: "West", rank: "E5", weapon_number: "E23", weapon_serial: "W487674", cco_serial: "K2091054", phone_number: "779-456-5242")
Soldier.create!(name: "Marrero", rank: "E5", weapon_number: "E22", weapon_serial: "W487640", cco_serial: "K2091048", phone_number: "815-641-2880")
Soldier.create!(name: "Steinmetz", rank: "E4", weapon_number: "E38", weapon_serial: "W511819", cco_serial: "K2093538", phone_number:"630-880-8271" )
Soldier.create!(name: "Maloney", rank: "E4", weapon_number: "E32", weapon_serial: "W509735", cco_serial: "K2091154", phone_number: "815-354-4637")
Soldier.create!(name: "Pivaral", rank: "E3", weapon_number: "E29", weapon_serial: "W508993", cco_serial: "K2091145" )
Soldier.create!(name: "Leal", rank: "E4", weapon_number: "E24", weapon_serial: "W499022", cco_serial: "K2091132", phone_number: "815-263-5437")
Soldier.create!(name: "Dean", rank: "E3", weapon_number: "E16", weapon_serial: "W487244", cco_serial: "K2001381", phone_number: "312-731-7909")

Soldier.create!(name: "Lescaie", rank: "E3", weapon_number: "E33", weapon_serial: "W509938", cco_serial: "K2093639", phone_number: "773-629-4873")
Soldier.create!(name: "Holt", rank: "E2", weapon_number: "saw", weapon_serial: "182391", cco_serial: "saw", phone_number: "815-842-7693")

Soldier.create!(name: "Boege", rank: "E4", weapon_number: "saw", weapon_serial: "182395", cco_serial: "saw", phone_number: "815-302-0381")

Soldier.create!(name: "Gavina", rank: "E4", weapon_number: "E31", weapon_serial: "W509543", cco_serial: "K2091149", phone_number: "815-322-6093")

Soldier.create!(name: "Gutierrez", rank: "E4", weapon_number: "E21", weapon_serial: "W487491", cco_serial: "K2091034", phone_number: "773-931-5012")

Soldier.create!(name: "Cortez", rank: "E4", weapon_number: "E15", weapon_serial: "W487221", cco_serial: "K2089174", phone_number: "847-271-4390")
Soldier.create!(name: "Crespo", rank: "E4", weapon_number: "saw", weapon_serial: "182037", cco_serial: "saw", phone_number: "815-666-5695")
Soldier.create!(name: "Tenard", rank: "E3", weapon_number: "E39", weapon_serial: "W511821", cco_serial: "K2093544", phone_number: "773-398-9281")
Soldier.create!(name: "Bennett", rank: "O2", weapon_number: "E14", weapon_serial: "W487217", cco_serial: "K2089173", phone_number: "812-374-2263")
Soldier.create!(name: "Smith", rank: "E5", weapon_number: "E25", weapon_serial: "W499051", cco_serial: "K2091137", phone_number: "309-299-3071")

Truck.create!(name: "G01", pen_name: "Ammo", model: "HMV", odometer: 0, radio_NSN: "false")
Truck.create!(name: "G02", pen_name: "Uparmored", model: "HMV", odometer: 0, radio_NSN: "false")
Truck.create!(name: "G09", pen_name: "G09", model: "LMTV", odometer: 9212, radio_NSN: "false")
Truck.create!(name: "G100", pen_name: "Supply", odometer: 0,model: "LMTV", radio_NSN: "false")
Truck.create!(name: "G12", pen_name: "A601", model: "LHS", odometer: 2696, radio_NSN: "false")
Truck.create!(name: "G30", model: "LHS", odometer: 0, radio_NSN: "false")
Truck.create!(name: "G31", model: "LHS", odometer: 0,radio_NSN: "false")
Truck.create!(name: "G32", model: "LHS", odometer: 0,radio_NSN: "false")
Truck.create!(name: "G33", model: "LHS", odometer: 0,radio_NSN: "false")
Truck.create!(name: "G35", pen_name: "NoName", model: "LHS", odometer: 4236, radio_NSN: "false")
Truck.create!(name: "G36", model: "LHS", odometer: 0,radio_NSN: "false")
Truck.create!(name: "G37", model: "LHS", odometer: 0,radio_NSN: "false")
Truck.create!(name: "G41", pen_name: "Fueler", odometer: 0,model: "Fueler",  radio_NSN: "false")


units = ["Alpha", "Bravo", "Charlie", "Delta", "Golf", "HHC"]
example_missions = ["Chow", "TrX", "Ammo", "RR"]

5.times do
	sl = Soldier.all
  tk = Truck.all
  # tl = Trailer.all

  soldier_list = []
  truck_list = []
  # trailer_list = []

  10.times do
  	soldier_list << sl.shuffle.pop.name
  end

  4.times do
  	truck_list << tk.shuffle.pop.name
  end

  # 3.times do
  # 	trailer_list << tl.shuffle.pop.name
  # end


  mission_params = {
    mission: {step_off_date:  1.day.from_now.strftime("%Y-%m-%d"),
              step_off_time:  Time.now.strftime("%H:%M"),
              return_date:    1.day.from_now.strftime("%Y-%m-%d"),
              return_time:    2.hours.from_now.strftime("%H:%M"),
              name:           example_missions.sample,
              unit_serviced:  units.sample },


    # trailers: [{"trailer_name" => trailer_list[0],
    #             "truck_name" =>   truck_list[0]},

    #             {"trailer_name" => trailer_list[1],
    #             "truck_name" =>   truck_list[1]},

    #             {"trailer_name" => trailer_list[2],
    #             "truck_name" =>   truck_list[2]}],


    payloads: [{vehicle_name: truck_list[3],
                payload: "Stuff and Things and more Stuff"},

                {vehicle_name: truck_list[2],
                 payload: "Peas and ^, they are more important than you think"}


                 ],

    passengers: [ {passenger_name:  soldier_list[0],
                   truck_name:  truck_list[0]},

              {passenger_name:  soldier_list[1],
               		 truck_name:  truck_list[1]} ],


    trucks: [ {truck_name:   truck_list[0],
    						driver_name: soldier_list[2],
    						a_driver_name: soldier_list[3]},

    						{truck_name:   truck_list[1],
    						driver_name: soldier_list[4],
    						a_driver_name: soldier_list[5]},

    						{truck_name:   truck_list[2],
    						driver_name: soldier_list[6],
    						a_driver_name: soldier_list[7]},

     						{truck_name:   truck_list[3],
    						driver_name: soldier_list[8],
    						a_driver_name: soldier_list[9]}]
  }

  Mission.create_new(mission_params)
end



# 5.times do
#   trucks = Truck.all
#   mission = Mission.new
#   soldiers = Soldier.all

#   mission.step_off_at = Time.now
#   mission.return_at = Time.now
#   mission.name  =         example_missions.sample
#   mission.unit_serviced = units.sample


#   (1..3).to_a.sample.times do
#     dispatch = Dispatch.new
#     # dispatch = mission.dispatches.build
#     dispatch.truck = trucks.shuffle.pop
#     (2..5).to_a.sample.times do |i|
#       roles = ["driver", "a_driver"] << "passenger" * 3
#       assignment = SoldierAssignment.new
#       assignment.soldier_id = soldiers.shuffle.pop
#       assignment = dispatch.soldier_assignments.build
#       assignment.soldier = soldiers.shuffle.pop
#       assignment.role = roles.shift
#     end
#     mission.dispatches << dispatch
#   end

#   mission.save
# end
