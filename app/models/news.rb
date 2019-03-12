class News < ApplicationRecord
  # == Schema Information
  #
  # Table name: abouts
  #
  #  id                     :integer
  #  title                  :string
  #  content                :text
  #  news_category_id       :string
  #  last_edit_desc         :text
  #  user_id                :bigint
  #  created_at             :datetime
  #  updated_at             :datetime
  #

  # Associations
  has_one :thumbnail_attachment, -> { where(name: 'thumbnail') }, class_name: "ActiveStorage::Attachment", as: :record, inverse_of: :record, dependent: false
  has_one :thumbnail_blob, through: :thumbnail_attachment, class_name: "ActiveStorage::Blob", source: :blob
  belongs_to :news_category
  belongs_to :user, :foreign_key => "user_id"
  has_many :comments, :as => :commentable, :dependent => :destroy

  # Validations
  validates :user_id, presence: true
  validates :news_category_id, presence: true

  # Rolify gem, act as resource of roles
  resourcify


  def to_param
    "#{id}-#{title.parameterize}"
  end
end
