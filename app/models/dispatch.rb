class Dispatch < ActiveRecord::Base
  belongs_to  :truck
  belongs_to  :mission
end
