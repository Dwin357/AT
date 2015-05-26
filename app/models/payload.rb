class Payload < ActiveRecord::Base
  belongs_to :loadable, polymorphic: true
end
