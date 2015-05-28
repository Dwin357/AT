class TrailerDispatch < ActiveRecord::Base
  belongs_to :trailer
  belongs_to :mission

  def self.check_out_trailer(trailers)
    trailers.map do |trailer|
      self.new(trailer: Trailer.find_by_name(trailer["name"]))
    end
  end

  def leave_wire
    self.out_wire = true
    self.save
    # if this gets wrapped in a transaction, chng sv to !
  end

  def safe_return
    self.returned = true
    self.save
  end

  def generate_trailer
    # trailer = Trailer.find_by_id(self.trailer)
    {trailer: trailer, returned: self.returned, dispatch_id: self.id, dispatch: self}
  end

end
