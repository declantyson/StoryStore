class CreateLocations < ActiveRecord::Migration
  def change
    drop_table :l_ocations
    create_table :locations do |t|
      t.string :name
      t.integer :project_id
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
