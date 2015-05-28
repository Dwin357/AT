get '/missions/new' do
  #this should only provide currently avaliable ppl,
  #off-line until the 'prevent double booking' validation is added
  @personnel = Soldier.all
  #as w/ ppl
  @trucks = Truck.all
  @trailers = Trailer.all
  erb :'planning/new_mission'
end

post '/missions' do
  Mission.create_new(params)
  redirect '/'
end

get '/missions/forms/:type' do
  erb :"partials/_#{params[:type]}", {layout: false}
end

get '/missions' do
  @unresolved_missions = Mission.unresolved_missions
  erb :'dispatch/forecast'
end

put '/missions/leave_wire/:id' do
  Mission.find_by_id(params[:id]).leave_wire
  redirect '/missions'
end

put '/missions/safe_return/:type/:id' do
  # I want to make this a polymorphic rounte
  # "/missions/safe_return/:type/:id", so then I can call
  # params[:type].constantize.find_by_id(params[:id]).safe_return

end


get '/missions/:id' do
  @mission_display = Mission.find_by_id(params[:id]).generateDisplay
  p @mission_display[:mission]
  erb :'dispatch/mission_display'
  # view a specific mission
  # presented with the buttons to close dispathes
end


put '' do
  # mark a mission as completed...
  # like the PUT /missions/:id above but calling a different meth
  # this should also be automatic when last pass/tk returns
  #
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

