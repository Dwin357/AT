get '/mission/new' do
  #this should only provide currently avaliable ppl,
  #off-line until the 'prevent double booking' validation is added
  @personnel = Soldier.all
  #as w/ ppl
  @trucks = Truck.all
  @trailers = Trailer.all
  erb :'planning/new_mission'
end


post '/mission' do
 
  Mission.transaction do

    mission = Mission.new 

    mission.step_off      ="#{params[:mission][:step_off_date]+" "+params[:mission][:step_off_time]+":00"}"
    mission.return        ="#{params[:mission][:return_date]+" "+params[:mission][:return_time]+":00"}"
    mission.name          = params[:mission][:name]
    mission.unit_serviced = params[:mission][:unit_serviced]


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
      mission.passengers = passenger_list
    end

        # this is also another method; needs refactoring
    if params[:trailers]
      trailer_dispatches = []
      params[:trailers].each do |trailer|
        trailer = Trailer.find_by!(name: trailer[:trailer_name])
        trailer_dispatches << TrailerDispatch.create!(trailer: trailer)
      end
      mission.trailer_dispatches = trailer_dispatches
    end

    if params[:payloads]
      params[:payloads].each do |payload|
        if /^TL.*/.match(payload[:vehicle_name])
          Payload.create!(
            payload: payload[:payload],
            vehicle_type: "Trailer",
            vehicle_id: Trailer.find_by!(name: payload[:vehicle_name]).id)
        else
          Payload.create!(
            payload: payload[:payload],
            vehicle_type: "Truck",
            vehicle_id: Truck.find_by!(name: payload[:vehicle_name]).id)
        end
      end
    end
    mission.save!
  end
  redirect '/'
end


post '/mission/add_truck' do
  erb :'partials/_add_truck', {layout: false}
end


post '/mission/add_passenger' do
  erb :'partials/_add_passenger', {layout: false}
end

post '/mission/add_payload' do
  erb :'partials/_add_payload', {layout: false}
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
