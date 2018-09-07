class Clan < ApplicationRecord
     CLANTIER = ['Ghost / Duch', 'Shadow / Cień', 'Storm / Burzy', 'Mountain / Góry', 'Moon / Księżyca']

  belongs_to :user
    default_scope -> { order(created_at: :desc) }

   validates :user_id, presence: true
   validates :about, presence: true, length: { maximum: 380 }
   validates :leader, presence: true
   validates :tier, presence: true
   validates :name, presence: true
   validates :members, presence: true
   validates :logo, presence: true
end
