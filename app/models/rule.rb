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

class Rule < ApplicationRecord

  # Associations
  belongs_to :principle
  belongs_to :rule_category, optional: true

  # Validations
  validates :principle, presence: true
end
