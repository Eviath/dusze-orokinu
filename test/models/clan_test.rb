# == Schema Information
#
# Table name: clans
#
#  id                 :bigint(8)        not null, primary key
#  leader             :string
#  name               :string
#  about              :text
#  members            :integer
#  tier               :string
#  picture            :string
#  website            :string
#  discord            :string
#  user_id            :bigint(8)
#  approval           :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  recruitment_status :boolean          default(TRUE)
#

require 'test_helper'

class ClanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
