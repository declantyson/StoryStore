# == Schema Information
#
# Table name: musics
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  project_id         :integer
#  artist             :string(255)
#  spotify_uri        :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Music < ActiveRecord::Base
  attr_accessible :artist, :project_id, :spotify_uri, :name, :image
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  belongs_to :project
  validates :spotify_uri, :length => { maximum: 200 }
  validates :name, :presence => true, :length => 3..100
end
