class User < ApplicationRecord
  # == Schema Information
  #
  # Table name: users
  #
  #  id                                 :integer
  #  email                              :string     null: false
  #  name                               :string
  #  lider                              :boolean
  #  encrypted_password                 :bigint     null: false
  #  confirmation_token                 :string
  #  confirmation_sent_at               :datetime
  #  reset_password_token               :string
  #  reset_password_sent_at             :datetime
  #  remember_created_at                :datetime
  #  sing_in_count                      :integer
  #  current_sign_in_at                 :datetime
  #  last_sign_in_at                    :datetime
  #  current_sign_in_ip                 :string
  #  last_sign_in_ip                    :string     default: false
  #  last_seen                          :datetime
  #  confirmed_at                       :datetime
  #  created_at                         :datetime
  #  updated_at                         :datetime
  #

  attr_accessor :input_roles
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
  has_many :news
  has_many :comments, through: :news, source: :comments
  has_one_attached :avatar
  has_many :likes, dependent: :destroy

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

  
  protected

  # = Turn off devise confirmation
  # def confirmation_required?
  #   false
  # end


end
