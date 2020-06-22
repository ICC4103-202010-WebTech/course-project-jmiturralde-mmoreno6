class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  validates :username, uniqueness: true
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                             message: "invalid email address" }, uniqueness: true
  has_one :profile_page
  has_one :mail_box
  has_many :events
  has_many :event_invitations
  has_many :events, :through => :event_invitations
  has_many :notifications
  has_many :organizations
  has_many :organization_invitations
  has_many :organizations, :through => :organization_invitations
  has_many :comments, :through => :event_invitations

  accepts_nested_attributes_for :profile_page

  after_initialize :default_values
  after_create :create_base

  private
  def default_values
    self.system_admin ||= false
  end

  def create_base
    MailBox.create(user: self)
  end

  def self.from_google(email:, first_name:, last_name:, uid:, avatar_url:)
    require 'securerandom'
    username = (first_name + last_name.delete(' ')).downcase
    create_with(uid: uid, username: username, password: SecureRandom.urlsafe_base64).find_or_create_by!(email: email)
  end
end
