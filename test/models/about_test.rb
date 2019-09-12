# == Schema Information
#
# Table name: abouts
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :string
#  assignment  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  content     :text
#

require 'test_helper'

class AboutTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
