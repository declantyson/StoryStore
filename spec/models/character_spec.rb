# == Schema Information
#
# Table name: characters
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  project_id         :integer
#  personality        :string(255)
#  quotes             :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

require 'spec_helper'

describe Character do
  pending "add some examples to (or delete) #{__FILE__}"
end
