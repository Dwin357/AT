class CreateDispatches < ActiveRecord::Migration
  def change
    create_table :dispatches do |t|
      t.integer :driver_id
      t.integer :a_driver_id
      t.integer :truck_id
      t.integer :mission_id
      t.boolean :out_wire, :value, default: false
      t.boolean :returned, :value, default: false
      t.integer :miles_at_return
      t.integer :miles_out

      t.timestamps
    end
  end
end
