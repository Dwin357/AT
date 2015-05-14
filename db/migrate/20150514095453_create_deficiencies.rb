class CreateDeficiencies < ActiveRecord::Migration
  def change
    create_table :deficiencies do |t|
      t.integer :vehicle_id
      t.string  :vehicle_type
      t.string  :deficiency
      t.integer :deadlined

      t.timestamps
    end
  end
end
