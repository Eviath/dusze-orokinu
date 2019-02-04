class News < ApplicationRecord

  has_one_attached :thumbnail
  resourcify


  belongs_to :user, :foreign_key => "user_id"


  validates :user_id, presence: true
end
