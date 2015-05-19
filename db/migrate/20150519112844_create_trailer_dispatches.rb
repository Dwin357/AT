class CreateTrailerDispatches < ActiveRecord::Migration
  def change
    create_table :trailer_dispatches do |t|
      t.integer   :mission_id
      t.integer   :trailer_id
      t.timestamps
    end
  end
end
