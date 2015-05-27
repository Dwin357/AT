class Soldier < ActiveRecord::Base
  has_many  :dispatches
  has_many  :passengers
  has_many :resource_statuses, as: :classification
end
