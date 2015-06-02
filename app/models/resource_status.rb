class ResourceStatus < ActiveRecord::Base

  # t.integer :resource_id
  # t.string  :resource_type
  # t.string  :status
  
  belongs_to  :classification, polymorphic: true


end
