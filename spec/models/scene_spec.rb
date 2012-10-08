# == Schema Information
#
# Table name: scenes
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  project_id :integer
#  image      :string(255)
#  entry      :string(255)
#  themes     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Scene do
  pending "add some examples to (or delete) #{__FILE__}"
end
