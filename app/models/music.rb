class Music < ActiveRecord::Base
  attr_accessible :artist, :project_id, :spotify_uri, :title
  belongs_to :project
end
