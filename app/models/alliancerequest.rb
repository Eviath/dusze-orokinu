class Alliancerequest < ApplicationRecord
   CLANTIER = ['Ghost / Duch / 10 osób', 'Shadow / Cień / 30 osób', 'Storm / Burzy / 100 osób', 'Mountain / Góry / 300 osób', 'Moon / Księżyca / 1000 osób']

  belongs_to :user
  scope :approved, -> { where(:approval => true) }
  scope :pending, -> { where(:approval => nil) }
  scope :declined, -> { where(:approval => false) }

  scope :newest, -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :nickname, presence: true, length: { maximum: 50 }
  validates :lider_nickname, presence: true, length: { maximum: 50 }
  validates :clan_name, presence: true, length: { maximum: 50 }
  validates :clan_tier, presence: true
  validates :clan_about, presence: true
  validates :clan_members, presence: true, length: { in: 1..4 }, numericality: { only_integer: true }
  validates :discord_check, acceptance: true
  validates :rules_check, acceptance: true

   resourcify

end
