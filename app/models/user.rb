class User < ApplicationRecord
  validates :username, uniqueness: true
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                             message: "invalid email address" }, uniqueness: true
  has_one :profile_page
  has_many :event_creators
  has_many :event_invitations
  has_many :events, :through => :event_invitations
  has_many :notifications, :through => :event_invitations
  has_many :organization_creators
  has_many :organization_invitations
  has_many :organizations, :through => :organization_invitations
  has_many :comments, :through => :event_invitations
  after_initialize :default_values
  private
  def default_values
    self.system_admin ||= false
  end
end

