class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.integer :soldier_id
      t.integer :mission_id
      t.boolean :out_wire, default: false
      t.boolean :returned, default: false

      t.timestamps
    end
  end
end
