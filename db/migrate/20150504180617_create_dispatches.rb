class CreateDispatches < ActiveRecord::Migration
  def change
    create_table :dispatches do |t|
      t.integer :driver_id
      t.integer :a_driver_id
      t.integer :completed

      t.timestamps
    end
  end
end
