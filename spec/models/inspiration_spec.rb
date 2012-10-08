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

require 'spec_helper'

describe Inspiration do
  pending "add some examples to (or delete) #{__FILE__}"
end
