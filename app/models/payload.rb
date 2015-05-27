class Payload < ActiveRecord::Base
  belongs_to :loadable, polymorphic: true


  def self.assign_payloads(loads)
    loads.each do |load|
      if /^TL.*/.match(load[:vehicle_name])
        Payload.create!(
          payload: load[:payload],
          vehicle_type: "Trailer",
          vehicle_id: Trailer.find_by!(name: load[:vehicle_name]).id)
      else
        Payload.create!(
          payload: load[:payload],
          vehicle_type: "Truck",
          vehicle_id: Truck.find_by!(name: load[:vehicle_name]).id)
      end
    end
  end


end
