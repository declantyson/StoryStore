# == Schema Information
#
# Table name: scenes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  project_id :integer
#  image      :string(255)
#  entry      :string(255)
#  themes     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Scene < ActiveRecord::Base
  attr_accessible :entry, :image, :project_id, :themes, :name, :image
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  belongs_to :project
  validate :name, :if => :name_is_default?
  
  def name_is_default?
  	self.errors.add(:name, 'your scene!') if name == "Please enter scene title..."
  	name == "Please enter scene title..."
  end
end
