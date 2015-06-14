get '/trucks' do
	@truck_list = Truck.build_index_display
	erb :'/resources/trucks_list'
end


get '/trucks/:id' do
  # view a specific truck
  # include all missions
  # include radio#, any deffencies + statuses
  # presented with btn to chng defficiences / status
  @truck_display = Truck.build_display(params[:id])
  erb :'/resources/truck_display'
end

post '' do
  # add a new truck
end
