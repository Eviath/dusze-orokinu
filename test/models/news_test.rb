# == Schema Information
#
# Table name: news
#
#  id               :bigint(8)        not null, primary key
#  title            :string
#  content          :text
#  user_id          :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  news_category_id :string
#  last_edit_desc   :text
#

require 'test_helper'

class NewsTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
