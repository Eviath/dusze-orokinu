class Clan < ApplicationRecord
     CLANTIER = ['Ghost / Duch', 'Shadow / Cień', 'Storm / Burzy', 'Mountain / Góry', 'Moon / Księżyca']
     scope :approved, -> { where(:approval => true) }
     has_one_attached :picture
     scope :pending, -> { where(:approval => false) }
     belongs_to :user, :foreign_key => "user_id"
    scope :newest, -> { order(created_at: :desc) }
   #   validations
   validates :user_id, presence: true
   validates :about, presence: true, length: {minimum: 3, maximum: 3000}
   validates :leader, presence: true, length: {minimum: 3, maximum: 30}
   validates :tier, presence: true
   validates :name, presence: true, length: {minimum: 3, maximum: 30}
   validates :members, presence: true, length: { in: 1..4 }, numericality: true

   #   validate members count
   validates_numericality_of :members , greater_than_or_equal_to: 1, less_than_or_equal_to: 10, if: :ghost_tier, :message => 'nie może przekraczać 10 przy wybranym tierze klanu.'
   validates_numericality_of :members , greater_than_or_equal_to: 1, less_than_or_equal_to: 30, if: :shadow_tier, :message => 'nie może przekraczać 30 przy wybranym tierze klanu.'
   validates_numericality_of :members , greater_than_or_equal_to: 1, less_than_or_equal_to: 100, if: :storm_tier, :message => 'nie może przekraczać 100 przy wybranym tierze klanu.'
   validates_numericality_of :members , greater_than_or_equal_to: 1, less_than_or_equal_to: 300, if: :mountain_tier, :message => 'nie może przekraczać 300 przy wybranym tierze klanu.'
   validates_numericality_of :members , greater_than_or_equal_to: 1, less_than_or_equal_to: 1000, if: :moon_tier, :message => 'nie może przekraczać 1000 przy wybranym tierze klanu.'

   validates :picture, presence: true

   validate :picture_validation
     resourcify

     def tier_enum
       # Do not select any value, or add any blank field. RailsAdmin will do it for you.
       ['Ghost / Duch', 'Shadow / Cień', 'Storm / Burzy', 'Mountain / Góry', 'Moon / Księżyca']
       # alternatively
       # { green: 0, white: 1 }
       # [ %w(Green 0), %w(White 1)]
     end


     # check for selected clan tier
     def ghost_tier
       tier == 'Ghost / Duch'
     end

     def shadow_tier
      tier == 'Shadow / Cień'
     end

     def storm_tier
       tier == 'Storm / Burzy'
     end

     def mountain_tier
       tier == 'Mountain / Góry'
     end

     def moon_tier
       tier == 'Moon / Księżyca'
     end



     private

     def picture_validation
       if picture.attached?
         if picture.blob.byte_size > 2000000
           picture.purge
           errors[:base] << 'Maksymalny rozmiar logo klanu to 2MB'
         elsif !picture.blob.content_type.starts_with?('image/')
           picture.purge
           errors[:base] << 'Zły format'
         end
       else
         errors[:base] << 'Logo klanu jest obowiązkowe.'
       end
     end


end
