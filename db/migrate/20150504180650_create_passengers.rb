class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.integer :soldier_id
      t.integer :mission_id

      t.timestamps
    end
  end
end
