class Comment < ApplicationRecord

  # == Schema Information
  #
  # Table name: abouts
  #
  #  id                     :integer
  #  content                :text
  #  ancestry               :string
  #  commentable_type       :string
  #  commentable_id         :bigint
  #  user_id                :integer
  #  created_at             :datetime
  #  updated_at             :datetime
  #

  # Associations
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  has_many :likes, dependent: :destroy
  # Scopes
  scope :newest, -> { order('created_at desc') }


  # Ancestry gem // Model act as tree structure
  has_ancestry
end
