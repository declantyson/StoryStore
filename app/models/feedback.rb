# == Schema Information
#
# Table name: feedbacks
#
#  id             :integer          not null, primary key
#  headline       :string(255)
#  rating         :integer
#  user_id        :integer
#  project_id     :integer
#  scene_id       :integer
#  character_id   :integer
#  location_id    :integer
#  music_id       :integer
#  inspiration_id :integer
#  comments       :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Feedback < ActiveRecord::Base
  attr_accessible :character_id, :comments, :headline, :inspiration_id, :location_id, :music_id, :project_id, :rating, :scene_id, :user_id
  belongs_to :user
  belongs_to :project
  belongs_to :character
  belongs_to :scene
  belongs_to :location
  belongs_to :music
  belongs_to :inspiration

  validates	:headline, :presence => true, :length => 3..15
  validates :rating, :inclusion => 1..5
  validates :comments, :length => { :maximum => 200 }
end
