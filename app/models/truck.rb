class Truck < ActiveRecord::Base
  has_many :deficiencies, as: :breakable
  has_many :payloads, as: :loadable
  has_many :resource_statuses, as: :classification
  has_many :dispatches

  # validates :name, presence: true
  # validates :model, presence: true
  # validates :odometer, presence: true

end
