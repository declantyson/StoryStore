# == Schema Information
#
# Table name: locations
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  project_id         :integer
#  image              :string(255)
#  description        :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Location < ActiveRecord::Base
  attr_accessible :description, :image, :name, :project_id, :image
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  belongs_to :project

  validates :name, :presence => true, :length => 3..100
  validates :description, :length => { :maximum => 200 }
end
