# == Schema Information
#
# Table name: notifications
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  user_id    :integer
#  read       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#

class Notification < ActiveRecord::Base
  attr_accessible :read, :title, :user_id
  belongs_to :user
  belongs_to :project
end
