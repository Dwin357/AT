class CreatePayloads < ActiveRecord::Migration
  def change
    create_table :payloads do |t|
      t.string  :payload
      t.integer :vehicle_id
      t.string  :vehicle_type
      t.boolean :downloaded, default: false

      t.timestamps
    end
  end
end
