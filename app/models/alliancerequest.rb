class Alliancerequest < ApplicationRecord
   CLANTIER = ['Ghost / Duch', 'Shadow / Cień', 'Storm / Burzy', 'Mountain / Góry', 'Moon / Księżyca']

  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :nickname, presence: true, length: { maximum: 50 }
  validates :lider_nickname, presence: true, length: { maximum: 50 }
  validates :clan_name, presence: true, length: { maximum: 50 }
  validates :clan_tier, presence: true
  validates :clan_about, presence: true, length: { maximum: 320 }
  validates :clan_members, presence: true, length: { in: 1..4 }, numericality: { only_integer: true }
  validates :discord_check, acceptance: true
  validates :rules_check, acceptance: true


end
