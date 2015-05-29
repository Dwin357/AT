class CreateTrailerDispatches < ActiveRecord::Migration
  def change
    create_table :trailer_dispatches do |t|
      t.integer   :mission_id
      t.integer   :trailer_id
      t.boolean :out_wire, default: false
      t.boolean :safe_return, default: false
      t.timestamps
    end
  end
end
