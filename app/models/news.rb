# == Schema Information
#
# Table name: news
#
#  id               :bigint(8)        not null, primary key
#  title            :string
#  content          :text
#  user_id          :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  news_category_id :string
#  last_edit_desc   :text
#

class News < ApplicationRecord

  # Associations
  has_one_attached :thumbnail
  belongs_to :news_category
  belongs_to :user, :foreign_key => "user_id"
  has_many :comments, :as => :commentable, :dependent => :destroy

  # Scopes
  scope :newest, -> { order('created_at desc') }

  # Validations
  validates :user_id, presence: true
  validates :news_category_id, presence: true

  # Rolify gem, act as resource of roles
  resourcify


  def to_param
    "#{id}-#{title.parameterize}"
  end

end
