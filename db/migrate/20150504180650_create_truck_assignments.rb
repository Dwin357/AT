class CreateTruckAssignments < ActiveRecord::Migration
  def change
    create_table :truck_assignments do |t|
      t.integer :soldier_id
      t.integer :mission_id
      t.string  :role
      t.boolean :out_wire, default: false
      t.boolean :safe_return, default: false

      t.timestamps
    end
  end
end
