class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string  :type
      t.datetime  :sp
      t.string    :radio

  end
end
