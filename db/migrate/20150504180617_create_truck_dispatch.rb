class CreateTruckDispatch < ActiveRecord::Migration
  def change
    create_table :truck_dispatch do |t|
      t.integer :driver_id
      t.integer :a_driver_id


    end
  end
end
