class CreateTrailerAssignments < ActiveRecord::Migration
  def change
    create_table :trailer_assignments do |t|
      t.integer   :dispatch_id
      t.integer   :trailer_id
      t.boolean :out_wire, default: false
      t.boolean :safe_return, default: false
      t.timestamps
    end
  end
end
