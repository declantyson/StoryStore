class AddWeightToNearlyEverything < ActiveRecord::Migration
  def change
  	add_column :characters, :weight, :integer
  	add_column :scenes, :weight, :integer
  	add_column :locations, :weight, :integer
  	add_column :musics, :weight, :integer
  	add_column :inspirations, :weight, :integer
  end
end
