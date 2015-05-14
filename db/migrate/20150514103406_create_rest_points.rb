class CreateRestPoints < ActiveRecord::Migration
  def change
    create_table :rest_points do |t|
      t.integer :mission_id
      t.string  :grid
      t.decimal :lat
      t.decimal :lng
      t.timestamps
    end
  end
end
