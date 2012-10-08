# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  user_id    :integer
#  synopsis   :string(255)
#  genres     :string(255)
#  format     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ActiveRecord::Base
  attr_accessible :format, :genres, :synopsis, :title, :user_id
  belongs_to :user
  has_many :characters
  has_many :scenes
  has_many :locations
  has_many :musics
  has_many :inspirations
  has_many :feedbacks
end
