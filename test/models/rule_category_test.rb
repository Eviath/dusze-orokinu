# == Schema Information
#
# Table name: rule_categories
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  rules_id    :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class RuleCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
