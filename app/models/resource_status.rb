class ResourceStatus < ActiveRecord::Base
  belongs_to  :classification, polymorphic: true
end
