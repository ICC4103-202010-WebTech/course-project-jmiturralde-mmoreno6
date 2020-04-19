class User < ApplicationRecord
  has_one :profile_page
  has_many :event_creators
  has_many :event_invitations
  has_many :events, :through => event_invitations
  has_many :notifications, :through => :event_invitations
  has_many :organization_creators
  has_many :organization_invitations
  has_many :organizations, :through => :organization_invitations
end
