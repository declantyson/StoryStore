class ChangeStringToText < ActiveRecord::Migration
  def up
  	change_column :characters, :personality, :text, :limit => nil
  	change_column :characters, :quotes, :text, :limit => nil
  	change_column :locations, :description, :text, :limit => nil
  end

  def down
  end
end
