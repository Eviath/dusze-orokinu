# == Schema Information
#
# Table name: comments
#
#  id               :bigint(8)        not null, primary key
#  content          :text
#  commentable_type :string
#  commentable_id   :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint(8)
#  ancestry         :string
#  like_id          :bigint(8)
#

class Comment < ApplicationRecord


  # Associations
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  has_many :likes, dependent: :destroy
  # Scopes
  scope :newest, -> { order('created_at desc') }


  # Ancestry gem // Model act as tree structure
  has_ancestry


end
