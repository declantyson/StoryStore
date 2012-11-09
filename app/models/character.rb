# == Schema Information
#
# Table name: characters
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  project_id  :integer
#  image       :string(255)
#  personality :string(255)
#  quotes      :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Character < ActiveRecord::Base
  attr_accessible :image, :name, :personality, :project_id, :quotes, :image
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  belongs_to :project

  validates :name, :presence => true
end
