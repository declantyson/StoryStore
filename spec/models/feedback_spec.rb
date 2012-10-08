# == Schema Information
#
# Table name: feedbacks
#
#  id             :integer          not null, primary key
#  headline       :string(255)
#  rating         :integer
#  user_id        :integer
#  project_id     :integer
#  scene_id       :integer
#  character_id   :integer
#  location_id    :integer
#  music_id       :integer
#  inspiration_id :integer
#  comments       :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe Feedback do
  pending "add some examples to (or delete) #{__FILE__}"
end
