class Principle < ApplicationRecord
  has_many :rule, dependent: :destroy
end
