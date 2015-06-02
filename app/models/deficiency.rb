class Deficiency < ActiveRecord::Base
  belongs_to :breakable, polymorphic: true

  # t.integer :vehicle_id
  # t.string  :vehicle_type
  # t.string  :deficiency
  # t.boolean :deadlined, default: false


end
