# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  project_id  :integer
#  image       :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Location < ActiveRecord::Base
  attr_accessible :description, :image, :name, :project_id, :image
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  belongs_to :project
end
