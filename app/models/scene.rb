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
  attr_accessible :entry, :image, :project_id, :themes, :name
  belongs_to :project
end
