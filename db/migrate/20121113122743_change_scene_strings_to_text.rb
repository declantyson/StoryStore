class ChangeSceneStringsToText < ActiveRecord::Migration
  def up
  	change_column :scenes, :entry, :text, :limit => nil
  end

  def down
  end
end
