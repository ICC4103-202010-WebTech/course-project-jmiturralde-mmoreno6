class Organization < ApplicationRecord
  belongs_to :organization_creator
  has_many :organization_invitations
  has_many :events
  has_many :users, :through => :organization_invitations
  has_one :organization_home_page
end