class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string    :name
      t.datetime  :step_off_date
      t.datetime  :step_off_time
      t.datetime  :return_date
      t.datetime  :return_time
      t.string    :unit_serviced
      t.timestamps
    end
  end
end
