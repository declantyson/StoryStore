class AddAttachmentThumbnailToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.has_attached_file :thumbnail
    end
  end

  def self.down
    drop_attached_file :projects, :thumbnail
  end
end
