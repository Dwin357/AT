class CreateTrailers < ActiveRecord::Migration
  def change
    create_table :trailers do |t|
      t.integer :number
      t.integer :truck_id
      t.timestamps
    end
  end
end
