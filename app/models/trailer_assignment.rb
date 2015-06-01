class TrailerAssignment < ActiveRecord::Base
  belongs_to :trailer
  belongs_to :dispatch

  validates :dispatch, presence: true
  validates :trailer, presence: true #, uniqueness: {scope: :mission}

  # def self.check_out_trailer(trailers)
  #   trailers.map do |trailer|
  #     self.create(trailer: Trailer.find_by_name(trailer["trailer_name"]))
  #   end
  # end

  def self.generate_assignment(params)
    self.new(trailer: Trailer.find_by_name(params[:name]))
  end

  def self.assign_trailers(trailers)
    trailers.each do |assignment_params|
      Dispatch.add_trailer(assignment_params)
    end
  end

  def leave_wire
    self.out_wire = true
    self.save
  end

  def has_returned
    safe_return = true
    self.save
  end

  def generate_trailer
    {trailer: trailer, returned: self.returned, dispatch_id: self.id}
  end

end
