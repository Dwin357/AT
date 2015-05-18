class CreateLoads < ActiveRecord::Migration
  def change
    create_table :loads do |t|
      t.string :load
      t.integer :vehicle_id
      t.string :vehicle_type

      t.timestamps
    end
  end
end
