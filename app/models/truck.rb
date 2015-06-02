class Truck < ActiveRecord::Base
  # t.string  :name   #G3
  # t.string  :model    #LMTV
  # t.string  :radio_NSN  # sensitive item serial number
  # t.integer :odometer

  has_many :deficiencies, as: :breakable
  has_many :payloads, as: :loadable
  has_many :resource_statuses, as: :classification
  has_many :dispatches
  has_many :missions, through: :dispatches

  validates :name, presence: true
  validates :model, presence: true
  validates :odometer, presence: true

end
