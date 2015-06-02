class TrailerAssignment < ActiveRecord::Base

  # t.integer   :dispatch_id
  # t.integer   :trailer_id
  # t.boolean   :out_wire, default: false
  # t.boolean   :safe_return, default: false

  belongs_to :trailer
  belongs_to :dispatch

  validates :dispatch, presence: true
  validates :trailer, presence: true #, uniqueness: {scope: :mission}


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

end
