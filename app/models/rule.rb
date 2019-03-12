class Rule < ApplicationRecord
  # == Schema Information
  #
  # Table name: rules
  #
  #  id                     :integer
  #  content                :text
  #  principle_id           :bigint
  #  rule_category_id       :bigint
  #  created_at             :datetime
  #  updated_at             :datetime
  #

  # Associations
  belongs_to :principle
  belongs_to :rule_category, optional: true

  # Validations
  validates :principle, presence: true
end
