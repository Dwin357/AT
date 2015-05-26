class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string    :name
      t.datetime  :step_off
      t.datetime  :return
      t.string    :unit_serviced
      t.boolean		:initiated, :value, default: false
      t.boolean		:completed, :value, default: false
      t.timestamps
    end
  end
end
