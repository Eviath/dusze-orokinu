class User < ApplicationRecord
  rolify
  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Mailboxer
  acts_as_messageable

  # Associations
  has_one :clan, dependent: :destroy
  has_one :alliancerequest, dependent: :destroy


  # mailboxer notifications
  def mailboxer_email(object)
    email
  end

  def feed
    Alliancerequest.where("user_id = ?", id)
  end



  private


  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end

end
