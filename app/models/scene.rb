# == Schema Information
#
# Table name: scenes
#
#  id                 :integer          not null, primary key
#  name               :string(255)      default("Please enter scene title...")
#  project_id         :integer
#  entry              :text
#  themes             :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Scene < ActiveRecord::Base
  attr_accessible :entry, :image, :project_id, :themes, :name, :image
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  belongs_to :project
  validate :name, :if => :name_is_default?
  validates :name, :presence => true, :length => 3..100
  
  def name_is_default?
  	self.errors.add(:name, 'your scene!') if name == "Please enter scene title..."
  	name == "Please enter scene title..."
  end
end
