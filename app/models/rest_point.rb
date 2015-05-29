class RestPoint < ActiveRecord::Base
  belongs_to  :mission

  validates :mission, presence: true
  validates :point, presence: true
end
