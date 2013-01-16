class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title
      t.integer :user_id
      t.boolean :read, {default: false}

      t.timestamps
    end
  end
end
