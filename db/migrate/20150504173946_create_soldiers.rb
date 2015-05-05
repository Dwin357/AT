class CreateSoldiers < ActiveRecord::Migration
  def change
    create_table :soldiers do |t|
      t.string :name
      t.string :rank
      t.boolean :hazmat
      t.string  :phone
      t.string  :weapon

      t.timestamps
    end
  end
end
