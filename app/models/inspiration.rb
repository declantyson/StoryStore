class Inspiration < ActiveRecord::Base
  attr_accessible :image, :project_id, :title
  belongs_to :project
end
