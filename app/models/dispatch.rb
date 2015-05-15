class Dispatch < ActiveRecord::Base
  belongs_to  :truck
  belongs_to  :mission
  belongs_to  :driver, class_name: "Soldier"
  belongs_to  :a_driver, class_name: "Soldier"
end
