class Character < ActiveRecord::Base
  attr_accessible :image, :name, :personality, :project_id, :quotes
  belongs_to :project
end
