get '/soldiers' do
	@soldier_list = Soldier.build_index_display
	erb :'/resources/soldiers_list'


end

get '/soldiers/:id' do
  # view a specific soldier
  # include all mission went on
  # include ph#, wep#, any statuses
  # presented w/ btn to chng status

  @soldier_display = Soldier.build_display(params[:id])
  erb :'/resources/soldier_display'
end

post '' do
  # add a new soldier
end

get '/soldiers.json' do
  Soldier.all.to_json
end
