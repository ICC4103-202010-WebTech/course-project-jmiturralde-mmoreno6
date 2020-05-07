class Organization < ApplicationRecord
  belongs_to :user
  has_many :organization_invitations
  has_many :events
  has_many :users, :through => :organization_invitations
  has_many :image_organization_pages
  has_many :video_organization_pages
  has_many :pdf_organization_pages
end