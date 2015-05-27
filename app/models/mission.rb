class Mission < ActiveRecord::Base
  has_many :rest_points
  has_many :passengers
  has_many :dispatches
  has_many :trailer_dispatches

  def self.create_new(params)

    self.transaction do

      mission = self.new

      mission.step_off      ="#{params[:mission][:step_off_date]+" "+params[:mission][:step_off_time]+":00"}"
      mission.return        ="#{params[:mission][:return_date]+" "+params[:mission][:return_time]+":00"}"
      mission.name          = params[:mission][:name]
      mission.unit_serviced = params[:mission][:unit_serviced]

      mission.dispatches << self.set_up_dispatches(params[:trucks])
      mission.passengers << self.set_up_passengers(params[:passengers])
      mission.trailer_dispatches << self.set_up_trailer_dispatches(params[:trailers])
      Payload.assign_payloads(params[:payloads]) if params[:payloads]

      mission.save!
    end
  end

  def self.set_up_dispatches(trucks)
    trucks.map do |dispatch_params|
      Dispatch.check_out_truck(dispatch_params)
    end
  end

  def self.set_up_passengers(passengers)
    return [] unless !!passengers
    Passenger.create_passenger_list(passengers)
  end

  def self.set_up_trailer_dispatches(trailers)
    return [] unless !!trailers
    TrailerDispatch.check_out_trailer(trailers)
  end

  def self.unresolved_missions
    missions = Hash.new
    unresolved = self.where(completed: false).sort_by{|mission| mission.step_off}.group_by {|mission| mission.initiated}
    missions[:uninitiated] = unresolved[false]
    missions[:initiated] = unresolved[true]
    missions
  end

  def dateTime
  	 t = self.step_off.to_s.chars
  	 "#{t[11..12].join}:#{t[14..15].join} - #{t[5..6].join}/#{t[8..9].join}"
  	# self.step_off
  end
end
