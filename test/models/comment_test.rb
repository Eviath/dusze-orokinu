# == Schema Information
#
# Table name: comments
#
#  id               :bigint(8)        not null, primary key
#  content          :text
#  commentable_type :string
#  commentable_id   :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint(8)
#  ancestry         :string
#  like_id          :bigint(8)
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
