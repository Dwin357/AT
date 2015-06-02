get '/missions/new' do
  @planning_resources = Mission.make_display_resource_list
  @display_option = params[:display_option]||"avaliable"
  erb :'planning/new_mission'
end

post '/missions' do
  Mission.create_new(params)
  redirect '/missions'
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

put '/missions/safe_return/:mission_id/:type/:type_id' do
  params[:type].constantize.find_by_id(params[:type_id]).safe_return
  Mission.find_by_id(params[:mission_id]).accountability_check
  redirect "/missions/#{params[:mission_id]}"
end

get '/missions/safe_return/:mission_id/:type/:type_id' do
  @returning_unit = params[:type].constantize.make_ck_in_display(params)
  @mission_id = params[:mission_id]
  erb :"dispatch/check_in_#{params[:type].downcase}"
end


get '/missions/:id' do
  @mission_display = 
      Mission.find_by_id(params[:id]).display_resources_trucks
  erb :'dispatch/mission_display'
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

