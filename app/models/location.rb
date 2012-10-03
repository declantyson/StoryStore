class Location < ActiveRecord::Base
  attr_accessible :description, :image, :name, :project_id
  belongs_to :project
end
