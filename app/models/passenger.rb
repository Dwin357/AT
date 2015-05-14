class Passenger < ActiveRecord::Base
  belongs_to :mission
  belongs_to :soldier
end
