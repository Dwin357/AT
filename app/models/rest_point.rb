class RestPoint < ActiveRecord::Base
  belongs_to  :mission

  # t.integer :mission_id
  # t.string  :point
      
  # validates :mission, presence: true
  # validates :point, presence: true
end
