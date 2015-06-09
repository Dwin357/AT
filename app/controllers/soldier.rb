get '/soldiers'do 
	@soldier_list = Soldier.build_index_display
	erb :'/resources/soldiers_list'


end

get '/soldiers/:id' do
  # view a specific soldier
  # include all mission went on
  # include ph#, wep#, any statuses
  # presented w/ btn to chng status

  @soldier_display = Soldier.build_display(params[:id])
  # Soldier.build_display not yet built
  erb :'/resources/soldier_display'
end

post '' do
  # add a new soldier
end
