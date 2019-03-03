class NewsCategory < ApplicationRecord
  has_many :news

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
