class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string  :name   #G3
      t.string	:pen_name	#E2
      t.string  :model    #LMTV
      t.string  :radio_NSN  # sensitive item serial number
      t.integer :odometer

      t.timestamps

    end
  end
end
