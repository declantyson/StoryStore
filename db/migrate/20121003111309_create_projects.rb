class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :user_id
      t.string :synopsis
      t.string :genres
      t.string :format

      t.timestamps
    end
  end
end
