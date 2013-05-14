# == Schema Information
#
# Table name: characters
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  project_id         :integer
#  personality        :string(255)
#  quotes             :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Character < ActiveRecord::Base
  attr_accessible :image, :name, :personality, :project_id, :quotes, :image, :weight
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  belongs_to :project

  validates :name, :presence => true, :length => 3..100
end
