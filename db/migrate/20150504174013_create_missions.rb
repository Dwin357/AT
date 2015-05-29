class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string    :name
      t.string    :unit_serviced
      t.datetime  :step_off_at
      t.datetime  :return_at
      t.boolean		:initiated, default: false
      t.boolean		:completed, default: false
      t.timestamps
    end
  end
end
