class Alliancerequest < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :nickname, presence: true
  validates :lider_nickname, presence: true
  validates :clan_name, presence: true
  validates :clan_tier, presence: true
  validates :clan_about, presence: true, length: { maximum: 320 }
  validates :clan_members, presence: true

end
