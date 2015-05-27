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


# get '/mission/:id' do
#   "you landed on GET /mission/#{params[:id]}"
#   # view a specific mission
#   # presented with the buttons to close dispathes
# end


get '' do
  # view payloads
end


get '' do
  # view a specific soldier
  # include all mission went on
  # include ph#, wep#, any statuses
  # presented w/ btn to chng status
end


get '' do
  # view a specific truck
  # include all missions
  # include radio#, any deffencies + statuses
  # presented with btn to chng defficiences / status

end


post '' do
  # mark a mission as completed...
  # this could be automatic when last pass/tk
  # returns though...
end


put '/mission/:id' do
  "you landed on POST /mission/#{params[:id]}"
  # mark a truck/soldier as leaving wire
end
