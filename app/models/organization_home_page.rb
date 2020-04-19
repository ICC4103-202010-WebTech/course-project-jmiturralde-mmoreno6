class OrganizationHomePage < ApplicationRecord
  belongs_to :organization
  has_many :image_organization_pages
  has_many :video_organization_pages
  has_many :pdf_organization_pages
end
