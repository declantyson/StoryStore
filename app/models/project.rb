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
