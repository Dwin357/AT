class Deficiency < ActiveRecord::Base
  belongs_to :breakable, polymorphic: true
end
