class DropLocations < ActiveRecord::Migration
  def up
    drop_table :l_ocations
  end

  def down
  end
end
