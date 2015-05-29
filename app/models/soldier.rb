class Soldier < ActiveRecord::Base
  has_many  :dispatches
  has_many  :passengers
  has_many :resource_statuses, as: :classification


  def update_miles(driven_miles)
  	miles += driven_miles
  	self.save
  end
  
end
