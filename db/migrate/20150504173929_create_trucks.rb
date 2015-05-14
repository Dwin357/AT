class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.integer :number   #G3
      t.integer :model    #LMTV
      t.integer :miles
      t.string  :radio  # sensitive item serial number
      t.integer :driver_id
      t.integer :a_driver_id

      t.timestamps

    end
  end
end
