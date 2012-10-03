class Feedback < ActiveRecord::Base
  attr_accessible :character_id, :comments, :headline, :inspiration_id, :location_id, :music_id, :project_id, :rating, :scene_id, :user_id
  belongs_to :user
  belongs_to :project
  belongs_to :character
  belongs_to :scene
  belongs_to :location
  belongs_to :music
  belongs_to :inspiration
end
