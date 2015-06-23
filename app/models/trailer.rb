class Trailer < ActiveRecord::Base

  # t.string :name

  has_many :deficiencies, as: :breakable
  has_many :payloads, as: :loadable
  has_many :resource_statuses, as: :classification

  has_many :trailer_assignments
  has_many :dispatches, through: :trailer_assignmentz
  has_many :missions, through: :dispatches

  # validates :name, presence: true

	def self.available
		all - TrailerAssignment.list_of_active_assignments.map{|ta| ta.trailer}
	end

end
