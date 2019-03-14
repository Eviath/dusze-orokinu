class Principle < ApplicationRecord
  # == Schema Information
  #
  # Table name: principles
  #
  #  id                     :integer
  #  title                  :text
  #  created_at             :datetime
  #  updated_at             :datetime
  #

  # Associations
  has_many :rule, dependent: :destroy
end
