class News < ApplicationRecord
  #####    news schema  #####
  #     t.string "title"
  #     t.text "content"
  #     t.bigint "user_id"
  #     t.datetime "created_at", null: false
  #     t.datetime "updated_at", null: false
  #     t.string "news_category_id"
  #     t.index ["user_id"], name: "index_news_on_user_id"


  has_one_attached :thumbnail
  belongs_to :news_category
  resourcify

  belongs_to :user, :foreign_key => "user_id"
  has_many :comments, :as => :commentable, :dependent => :destroy

  validates :user_id, presence: true
  validates :news_category_id, presence: true

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
