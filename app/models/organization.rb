class Organization < ApplicationRecord
  belongs_to :user
  has_many :organization_invitations
  has_many :events
  has_many :users, :through => :organization_invitations
  has_many :image_organization_pages
  has_many :video_organization_pages
  has_many :pdf_organization_pages
  has_one_attached :organization_picture
  has_many_attached :documents
  has_many_attached :videos
  has_many_attached :images
  accepts_nested_attributes_for :organization_invitations, allow_destroy: true
end