class CreateLoads < ActiveRecord::Migration
  def change
    create_table :loads do |t|
      t.string :name
      t.string :phone_number
      t.string :weapon_number
      t.string :rank
      t.integer :miles

      t.timestamps
    end
  end
end
