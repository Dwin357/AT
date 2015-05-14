class Truck < ActiveRecord::Base
  has_many :deficiencies, as: :breakable
  has_many :loads, as: :loadable
  has_many :resource_statuses, as: :classification
  has_many :trailers
  has_many :dispatches
  belongs_to  :driver, class_name: "Soldier"
  belongs_to  :a_driver, class_name: "Soldier"
end
