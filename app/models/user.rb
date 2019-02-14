class User < ApplicationRecord
  rolify
  after_create :assign_default_role
  # before_create :assign_avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lastseenable, :confirmable

  # Mailboxer
  acts_as_messageable

  # Associations
  has_one :clan, dependent: :destroy
  has_one :request, dependent: :destroy
  has_many :news

  has_one_attached :avatar


  # mailboxer notifications
  def mailboxer_email(object)
    email
  end

  def feed
    Request.where("user_id = ?", id)
  end



  private

  # def assign_avatar
  #   self.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'vitru-glyph.png')), filename: 'default-image.png', content_type: 'image/png')
  # end

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end

  
  protected

  # no confirmation needed, for development
  def confirmation_required?
    false
  end


end
