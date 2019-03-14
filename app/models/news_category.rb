class NewsCategory < ApplicationRecord
  # == Schema Information
  #
  # Table name: abouts
  #
  #  id                     :integer
  #  name                   :string
  #  description            :text
  #  created_at             :datetime
  #  updated_at             :datetime
  #

  # Associations
  has_many :news

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
