class CreateDispatches < ActiveRecord::Migration
  def change
    create_table :dispatches do |t|
      t.integer :truck_id
      t.integer :mission_id
      t.boolean :out_wire, default: false
      t.boolean :safe_return, default: false
      t.integer :miles_at_return
      t.integer :miles_at_dispatch

      t.timestamps
    end
  end
end
