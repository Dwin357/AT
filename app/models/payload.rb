class Load < ActiveRecord::Base
  belongs_to :loadable, polymorphic: true
end
