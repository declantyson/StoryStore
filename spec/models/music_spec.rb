# == Schema Information
#
# Table name: musics
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  project_id  :integer
#  artist      :string(255)
#  spotify_uri :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Music do
  pending "add some examples to (or delete) #{__FILE__}"
end
