# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  lider                  :boolean          default(FALSE)
#  last_seen              :datetime
#  sign_in_count          :integer
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#

class User < ApplicationRecord
  # Destroy all likes associated with user before User destroy
  before_destroy :destroy_likes

  # Assign default role after user create action
  after_create :assign_default_role

  # Settings for user
  has_settings :notification, :defaults => { :news => false }

  # Has roles with rolify gem
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lastseenable, :confirmable, :trackable

  # Mailboxer
  acts_as_messageable

  # Associations
  has_one :clan, dependent: :destroy
  has_one :request, dependent: :destroy
  has_many :news,  dependent: :destroy
  has_many :comments,  dependent: :destroy
  has_one_attached :avatar
  has_many :likes, through: :comments, dependent: :destroy

  # Mailboxer notifications
  def mailboxer_email(object)
    email
  end

  def feed
    Request.where("user_id = ?", id)
  end

  private

  #  Assign default role on user creation by rolify gem
  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end

  def destroy_likes
    Like.where(user_id: self[:id]).delete_all
  end
  
  protected

  # = Turn off devise confirmation
  # def confirmation_required?
  #   false
  # end


end
