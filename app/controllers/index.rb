get '/' do
  # Look in app/views/index.erb


  @missions = Mission.all.sort_by {|mission| mission.step_off_at}

  erb :index



end
