class TrailerDispatch < ActiveRecord::Base
  belongs_to :trailer
  belongs_to :mission

  def self.check_out_trailer(trailers)
    trailers.map do |trailer|
      self.new(trailer: Trailer.find_by_name(trailer["name"]))
    end
  end

end
