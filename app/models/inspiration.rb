# == Schema Information
#
# Table name: inspirations
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  image      :string(255)
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Inspiration < ActiveRecord::Base
  attr_accessible :image, :project_id, :title
  belongs_to :project
end
