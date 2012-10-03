class Scene < ActiveRecord::Base
  attr_accessible :entry, :image, :project_id, :themes, :title
  belongs_to :project
end
