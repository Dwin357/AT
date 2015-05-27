class CreateSoldiers < ActiveRecord::Migration
  def change
    create_table :soldiers do |t|
      t.string :name
      t.string :rank
      t.string  :phone_number
      t.string  :weapon_number
      t.integer :miles

      t.timestamps
    end
  end
end


