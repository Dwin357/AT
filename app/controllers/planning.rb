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

    #this params[:mission] part is not currently working
    mission = Mission.create!(params[:mission])

    # this is clearly a method; needs refactoring
    dispatches = []
    params[:truck].each do |dispatch_params|
      truck = Truck.find_by!(name: dispatch_params[:truck_name])
      driver = Soldier.find_by!(name: dispatch_params[:driver_name])
      a_driver = Soldier.find_by!(name: dispatch_params[:a_driver_name])
      dispatches << Dispatch.create!(truck: truck, driver_id: driver.id,
        a_driver_id: a_driver.id)
    end
    mission.dispatches = dispatches

    # this is also another method; needs refactoring
    if params[:passengers]
      passenger_list = []
      params[:passengers].each do |passenger|
        soldier = Soldier.find_by!(name: passenger[:name])
        passenger_list << Passenger.create!(soldier: soldier)
      end
      mission.passengers = passengers
    end

        # this is also another method; needs refactoring
    if params[:trailers]
      trailer_list = []
      params[:trailers].each do |trailer|
        trailer = Trailer.find_by!(number: trailer[:number])
        trailer_list << Passenger.create!(soldier: soldier)
      end
      mission.passengers = passengers
    end

        # this is also another method; needs refactoring
        # trailers will have the TL prefix while trucks will be G
        # how can I grab this to determine vehicle type?
    # if params[:passengers]
    #   passenger_list = []
    #   params[:passengers].each do |passenger|
    #     soldier = Soldier.find_by!(name: passenger[:name])
    #     passenger_list << Passenger.create!(soldier: soldier)
    #   end
    #   mission.passengers = passengers
    # end

    mission.save!
  end
  redirect '/'
end


post '/mission/add_truck' do
  # supports ajax to append a new truck field to the mission form
  erb :'partials/_add_truck', {layout: false}
end


post '/mission/add_passenger' do
  # support ajax to append a new passenger field to the mission form
  erb :'partials/_add_passenger', {layout: false}
end

post '/mission/add_load' do
  erb :'partials/_add_load', {layout: false}
end

post '/mission/add_trailer' do
  erb :'partials/_add_trailer', {layout: false}
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
