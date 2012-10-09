# == Schema Information
#
# Table name: projects
#
#  id                     :integer          not null, primary key
#  title                  :string(255)
#  user_id                :integer
#  synopsis               :string(255)
#  genres                 :string(255)
#  format                 :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  thumbnail_file_name    :string(255)
#  thumbnail_content_type :string(255)
#  thumbnail_file_size    :integer
#  thumbnail_updated_at   :datetime
#

class Project < ActiveRecord::Base
  attr_accessible :format, :genres, :synopsis, :title, :user_id, :thumbnail
  belongs_to :user
  has_many :characters
  has_many :scenes
  has_many :locations
  has_many :musics
  has_many :inspirations
  has_many :feedbacks

  validates :title, presence: true, length: {minimum: 4, maximum: 255}
  has_attached_file :thumbnail, styles: { medium: "300x300>", thumb: "100x100>" }
end
