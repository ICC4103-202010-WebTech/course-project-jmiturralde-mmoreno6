class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  validates :username, uniqueness: true
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                             message: "invalid email address" }, uniqueness: true
  validates_acceptance_of :terms, :allow_nil => false, :accept => true, :on => :create

  has_one :profile_page, :dependent => :destroy
  has_one :mail_box, :dependent => :destroy
  has_many :events, :dependent => :destroy
  has_many :event_invitations, :dependent => :destroy
  has_many :events, :through => :event_invitations
  has_many :notifications, :dependent => :destroy
  has_many :organizations, :dependent => :destroy
  has_many :organization_invitations, :dependent => :destroy
  has_many :organizations, :through => :organization_invitations
  has_many :comments, :through => :event_invitations

  accepts_nested_attributes_for :profile_page, allow_destroy: true

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
    create_with(uid: uid, username: username, password: SecureRandom.urlsafe_base64, terms: true).find_or_create_by!(email: email)
  end
end
