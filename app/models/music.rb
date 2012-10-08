# == Schema Information
#
# Table name: musics
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  project_id  :integer
#  artist      :string(255)
#  spotify_uri :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Music < ActiveRecord::Base
  attr_accessible :artist, :project_id, :spotify_uri, :title
  belongs_to :project
end
