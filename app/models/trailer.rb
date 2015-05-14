class Trailer < ActiveRecord::Base
  has_many :deficiencies, as: :breakable
  has_many :loads, as: :loadable
  has_many :resource_statuses, as: :classification
  belongs_to :truck
end
