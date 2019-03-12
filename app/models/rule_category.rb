class RuleCategory < ApplicationRecord
  # == Schema Information
  #
  # Table name: rule_categories
  #
  #  id                     :integer
  #  name                   :string
  #  description            :text
  #  rules_id               :bigint
  #  created_at             :datetime
  #  updated_at             :datetime
  #

  # Associations
  has_many :rule
end
