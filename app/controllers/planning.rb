get '/mission/new' do
   #this should only provide currently avaliable ppl,
   #off-line until the 'prevent double booking' validation is added
   @personnel = Soldier.all

   #as w/ ppl
   @trucks = Truck.all

  erb :'planning/new_mission'
end

post '/mission' do
  puts params
  # if mission = Mission.create(params[:mission])
  # "#{params}"
  # "you made it"
  # end
  Mission.transaction do
    mission = Mission.create!(params[:mission])
    dispatches = []
    params[:truck].each do |dispatch_params|
      truck = Truck.find_by!(name: dispatch_params[:truck_name])
      driver = Soldier.find_by!(name: dispatch_params[:driver_name])
      a_driver = Soldier.find_by!(name: dispatch_params[:a_driver_name])
      dispatches << Dispatch.create!(truck: truck, driver_id: driver.id,
        a_driver_id: a_driver.id)
    end
    mission.dispatches = dispatches
    mission.save!
  end


end


get '/mission/add_truck' do
  erb :'partials/_add_truck'
end



# def create_mission_details
# #this method is to

#   Mission.transaction do
#     mission = Mission.create!(params[:mission])
      #     # <input name='trucks[0][number]' />
      #     # <input name='trucks[0][driver_id] />'
      #     # <input name='trucks[1][number]' />
      #     # <input name='trucks[1][driver_id] />'
      #     dispatches = []
#     params[:trucks].each do |truck_params|
#       truck = Truck.find_by!(number: truck_params[:number])
#       dispatches << Dispatch.create!(truck: truck, mission: mission)
#     end

#     mission.dispatches = dispatches
#     mission.save!
#   end
# end


post '/rp' do

end
