require "application_system_test_case"

class Admin::OrganizationsTest < ApplicationSystemTestCase
  setup do
    @admin_organization = admin_organizations(:one)
  end

  test "visiting the index" do
    visit admin_organizations_url
    assert_selector "h1", text: "Admin/Organizations"
  end

  test "creating a Organization" do
    visit admin_organizations_url
    click_on "New Admin/Organization"

    click_on "Create Organization"

    assert_text "Organization was successfully created"
    click_on "Back"
  end

  test "updating a Organization" do
    visit admin_organizations_url
    click_on "Edit", match: :first

    click_on "Update Organization"

    assert_text "Organization was successfully updated"
    click_on "Back"
  end

  test "destroying a Organization" do
    visit admin_organizations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Organization was successfully destroyed"
  end
end
