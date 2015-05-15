get '/mission/new' do
   @personnel #= this provides currently avaliable ppl, it is off-line until the 'prevent double booking' validation is added to the model

   @trucks #= this is off-line as w/ ppl

  erb :'planning/new_mission'
end

post '/mission' do
  # if mission = Mission.create(params[:mission])
  # "#{params}"
  # "you made it"
  # end
  Mission.transaction do
    mission = Mission.create!(params[:mission])
    dispatches = []
    params[:trucks].each do |truck_params|
      truck = Truck.find_by!(number: truck_params[:number])
      dispatches << Dispatch.create!(truck: truck, driver_id: driver_id,
        a_driver_id: a_driver_id)
    end
    mission.dispatches = dispatches
    mission.save!
  end


end


# get '/mission/truck_form/:last_i' do
#   erb :'planning/add_truck', { locals: { i: params[:last_index]+1 }}
# end



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
