class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
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
  after_initialize :default_values
  after_create :create_base

  private
  def default_values
    self.system_admin ||= false
  end
  def self.search(search)
    if search
      user_name = self.find_by(user_name: search)
    end
  end

  def create_base
    MailBox.create(user: self)
  end
end
