# == Schema Information
#
# Table name: requests
#
#  id             :bigint(8)        not null, primary key
#  nickname       :string
#  lider_nickname :string
#  clan_name      :string
#  clan_members   :integer
#  clan_tier      :string
#  clan_about     :text
#  discord_check  :boolean          default(FALSE)
#  rules_check    :boolean          default(FALSE)
#  user_id        :bigint(8)
#  approval       :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Request < ApplicationRecord

  # String options for clan_tier select
  CLANTIER = ['Ghost / Duch / 10 osób', 'Shadow / Cień / 30 osób', 'Storm / Burzy / 100 osób', 'Mountain / Góry / 300 osób', 'Moon / Księżyca / 1000 osób']

  # Associations
  belongs_to :user, :foreign_key => "user_id"

  # Scopes
  scope :approved, -> { where(:approval => true) }
  scope :pending, -> { where(:approval => nil) }
  scope :declined, -> { where(:approval => false) }
  scope :newest, -> { order(created_at: :desc) }

  # Validations
  validates :user_id, presence: true
  validates :nickname, presence: true, length: { maximum: 50 }
  validates :lider_nickname, presence: true, length: {minimum: 3, maximum: 30}
  validates :clan_name, presence: true, length: {minimum: 3, maximum: 30}
  validates :clan_tier, presence: true
  validates :clan_about, presence: true, length: {minimum: 3, maximum: 1500}
  validates :discord_check, acceptance: true
  validates :rules_check, acceptance: true
  validates :clan_members, presence: true, length: { in: 1..4 }, numericality: true

   # Validate members count / clan_members column
   validates_numericality_of :clan_members , greater_than_or_equal_to: 1, less_than_or_equal_to: 10, if: :ghost_tier, :message => 'nie może przekraczać 10 przy wybranym tierze klanu.'
   validates_numericality_of :clan_members , greater_than_or_equal_to: 1, less_than_or_equal_to: 30, if: :shadow_tier, :message => 'nie może przekraczać 30 przy wybranym tierze klanu.'
   validates_numericality_of :clan_members , greater_than_or_equal_to: 1, less_than_or_equal_to: 100, if: :storm_tier, :message => 'nie może przekraczać 100 przy wybranym tierze klanu.'
   validates_numericality_of :clan_members , greater_than_or_equal_to: 1, less_than_or_equal_to: 300, if: :mountain_tier, :message => 'nie może przekraczać 300 przy wybranym tierze klanu.'
   validates_numericality_of :clan_members , greater_than_or_equal_to: 1, less_than_or_equal_to: 1000, if: :moon_tier, :message => 'nie może przekraczać 1000 przy wybranym tierze klanu.'

   # Rolify gem - act as rolify resource
   resourcify


   # Check for selected clan tier
   def ghost_tier
     clan_tier == 'Ghost / Duch / 10 osób'
   end

   def shadow_tier
     clan_tier == 'Shadow / Cień / 30 osób'
   end

   def storm_tier
     clan_tier == 'Storm / Burzy / 100 osób'
   end

   def mountain_tier
     clan_tier == 'Mountain / Góry / 300 osób'
   end

   def moon_tier
     clan_tier == 'Moon / Księżyca / 1000 osób'
   end

  def decorated
    RequestDecorator.new self
  end

end
