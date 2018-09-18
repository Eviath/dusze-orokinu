class Clan < ApplicationRecord
     CLANTIER = ['Ghost / Duch', 'Shadow / Cień', 'Storm / Burzy', 'Mountain / Góry', 'Moon / Księżyca']
     scope :approved, -> { where(:approval => true) }
     scope :pending, -> { where(:approval => false) }
     belongs_to :lider, :class_name => "User", :foreign_key => "user_id"
    scope :newest, -> { order(created_at: :desc) }
    mount_uploader :picture, PictureUploader
   validates :user_id, presence: true
   validates :about, presence: true
   validates :leader, presence: true
   validates :tier, presence: true
   validates :name, presence: true
   validates :members, presence: true
   validates :picture, presence: true
   validate  :picture_size



private


def self.next(clan)
  where('id < ?', clan.id).last
end

def self.previous(clan)
  where('id > ?', clan.id).first
end

   # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "Rozmiar pliku nie może przekraczać 5MB")
      end
    end


end
