class AddOrganizationHomePageIdToPdfOrganizationPage < ActiveRecord::Migration[6.0]
  def change
    add_reference :pdf_organization_pages, :organization_home_page, null: true, foreign_key: true
  end
end
