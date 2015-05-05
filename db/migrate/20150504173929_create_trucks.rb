class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.integer :number   #G3
      t.integer :model    #LMTV
      #t.boolean :truck_in
      #t.boolean :key_in
      t.integer :miles
      t.text  :special  #HAZMT / FOOD / GARBAGE
      t.text  :deficiencies   #L_mirror_smashed
      t.string  :radio  # sensitive item serial

      t.timestamps

    end
  end
end
