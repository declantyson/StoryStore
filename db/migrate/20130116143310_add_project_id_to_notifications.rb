class AddProjectIdToNotifications < ActiveRecord::Migration
  def change
  	add_column :notifications, :project_id, :integer
  end
end
