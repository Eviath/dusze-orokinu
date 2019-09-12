# == Schema Information
#
# Table name: rules
#
#  id               :bigint(8)        not null, primary key
#  content          :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  principle_id     :bigint(8)
#  rule_category_id :bigint(8)
#

require 'test_helper'

class RuleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
