class News < ApplicationRecord

  has_one_attached :thumbnail
  resourcify


  belongs_to :user, :foreign_key => "user_id"
  has_many :comments, :as => :commentable, :dependent => :destroy

  validates :user_id, presence: true
end
