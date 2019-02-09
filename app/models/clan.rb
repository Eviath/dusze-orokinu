class Clan < ApplicationRecord
     CLANTIER = ['Ghost / Duch', 'Shadow / Cień', 'Storm / Burzy', 'Mountain / Góry', 'Moon / Księżyca']
     scope :approved, -> { where(:approval => true) }
     has_one_attached :picture
     scope :pending, -> { where(:approval => false) }
     belongs_to :user, :foreign_key => "user_id"
    scope :newest, -> { order(created_at: :desc) }
   validates :user_id, presence: true
   validates :about, presence: true
   validates :leader, presence: true
   validates :tier, presence: true
   validates :name, presence: true
   validates :members, presence: true
   validates :picture, presence: true

     resourcify

     def tier_enum
       # Do not select any value, or add any blank field. RailsAdmin will do it for you.
       ['Ghost / Duch', 'Shadow / Cień', 'Storm / Burzy', 'Mountain / Góry', 'Moon / Księżyca']
       # alternatively
       # { green: 0, white: 1 }
       # [ %w(Green 0), %w(White 1)]
     end


private



end
