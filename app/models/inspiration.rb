# == Schema Information
#
# Table name: inspirations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image      :string(255)
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Inspiration < ActiveRecord::Base
  attr_accessible :image, :project_id, :name, :image
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  belongs_to :project
end
