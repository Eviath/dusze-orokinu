# == Schema Information
#
# Table name: news_categories
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  desc       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class NewsCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
