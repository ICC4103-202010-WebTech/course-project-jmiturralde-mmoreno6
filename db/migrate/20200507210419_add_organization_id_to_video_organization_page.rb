class AddOrganizationIdToVideoOrganizationPage < ActiveRecord::Migration[6.0]
  def change
    add_reference :video_organization_pages, :organization, null: true, foreign_key: true
  end
end
