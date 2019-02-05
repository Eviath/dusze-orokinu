class Rule < ApplicationRecord
  belongs_to :principle
  belongs_to :rule_category, optional: true
  validates :principle, presence: true
end
