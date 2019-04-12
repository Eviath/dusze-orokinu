# == Schema Information
#
# Table name: news_categories
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  desc       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class NewsCategory < ApplicationRecord

  # Associations
  has_many :news

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
