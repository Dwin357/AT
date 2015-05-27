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
  Mission.create_new(params)
  redirect '/'
end

get '/mission/forms/:type' do
  erb :"partials/_#{params[:type]}", {layout: false}
end

get '/mission' do
  @unresolved_missions = Mission.unresolved_missions
  erb :'dispatch/forecast'
end

put '/mission/:id' do
  Mission.find_by_id(params[:id]).leave_wire
  redirect '/mission'
end


get '/mission/:id' do
  @mission = Mission.find_by_id(params[:id])
  @passengers = @mission.passengers
  @dispatches = @mission.dispatches
  @trailer_dispatches = @mission.trailer_dispatches
  erb :'dispatch/mission_display'
  # view a specific mission
  # presented with the buttons to close dispathes
end


post '' do
  # mark a mission as completed...
  # this could be automatic when last pass/tk
  # returns though...
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

