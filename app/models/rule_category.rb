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

class RuleCategory < ApplicationRecord

  # Associations
  has_many :rule
end
