class Mission < ActiveRecord::Base
  has_many :rest_points
  has_many :passengers
  has_many :dispatches
  has_many :trailer_dispatches


  def dateTime
  	 t = self.step_off.to_s.chars
  	 "#{t[11..12].join}:#{t[14..15].join} - #{t[5..6].join}/#{t[8..9].join}"
  	# self.step_off
  end
end
