class CreateResourceStatuses < ActiveRecord::Migration
  def change
    create_table :resource_statuses do |t|
      t.integer :resource_id
      t.string  :resource_type
      t.string  :status
      t.timestamps
    end
  end
end
