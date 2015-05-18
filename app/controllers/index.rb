get '/' do
  # Look in app/views/index.erb


  @current_missions = Mission.all
  #this should actually be something like this (needs syntax work)
  #@current_missions = Mission.where(end_date: < time.now)
  #@active_missions = @current_missions | Mission.where(start_date: > time.now)

  erb :index
end
