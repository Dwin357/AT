class Mission < ActiveRecord::Base
  has_many :rest_points
  has_many :passengers
  has_many :dispatches
end
