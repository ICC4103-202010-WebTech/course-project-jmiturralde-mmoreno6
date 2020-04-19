class OrganizationCreator < ApplicationRecord
  belongs_to :user
  has_one :organization
end
