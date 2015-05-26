class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string    :name
      t.datetime  :step_off
      t.datetime  :return
      t.string    :unit_serviced
      t.boolean		:initiated, default: false
      t.boolean		:completed, default: false
      t.timestamps
    end
  end
end
