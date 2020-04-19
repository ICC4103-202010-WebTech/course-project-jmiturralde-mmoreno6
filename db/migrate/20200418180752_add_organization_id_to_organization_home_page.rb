class AddOrganizationIdToOrganizationHomePage < ActiveRecord::Migration[6.0]
  def change
    add_reference :organization_home_pages, :organization, null: true, foreign_key: true
  end
end
