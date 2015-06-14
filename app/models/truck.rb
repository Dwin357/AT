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

### v-class ####

  def self.avaliable
    all.reject(&:on_mission?)
  end

### ^- class  v-instance ####

  def unfinished_dispatch_time_ranges
    dispatches.where(safe_return: false).map(&:active_time_window)
  end

  def on_mission?
    dispatches.where(safe_return: false, out_wire: true).any?
  end

  def name_model
    "#{name} #{model}"
  end



end
