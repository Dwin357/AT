class CreateTrailers < ActiveRecord::Migration
  def change
    create_table :trailers do |t|
      t.string :name
      t.timestamps
    end
  end
end
