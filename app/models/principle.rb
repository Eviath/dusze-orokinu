# == Schema Information
#
# Table name: principles
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#

class Principle < ApplicationRecord

  # Associations
  has_many :rule, dependent: :destroy
end
