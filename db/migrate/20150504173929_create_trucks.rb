class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :name   #G3
      t.string :model    #LMTV
      t.integer :miles
      t.string  :radio  # sensitive item serial number

      t.timestamps

    end
  end
end
