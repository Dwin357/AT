get '/mission/new' do
  #this should only provide currently avaliable ppl,
  #off-line until the 'prevent double booking' validation is added
  @personnel = Soldier.all
  #as w/ ppl
  @trucks = Truck.all
  erb :'planning/new_mission'
end

post '/mission' do
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


post '/mission/add_truck' do
  # supports ajax to append a new truck field to the mission form
  erb :'partials/_add_truck'
end


post '/mission/add_passenger' do
  # support ajax to append a new passenger field to the mission form
end


post '/rp' do
  # saves a new rest point to the database, then displays map w/ new rp on it
end


delete '/rp' do
  # as it says
end


put '/rp' do
  # as it says
end
