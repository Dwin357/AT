class TrailerDispatch < ActiveRecord::Base
  belongs_to :trailer
  belongs_to :mission
end
