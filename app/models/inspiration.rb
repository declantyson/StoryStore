# == Schema Information
#
# Table name: inspirations
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  project_id         :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Inspiration < ActiveRecord::Base
  attr_accessible :image, :project_id, :name, :image, :weight
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  belongs_to :project

  validates :name, :presence => true, :length => 3..100
  validates :image, :attachment_presence => true
end
