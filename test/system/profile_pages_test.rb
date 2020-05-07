require "application_system_test_case"

class ProfilePagesTest < ApplicationSystemTestCase
  setup do
    @profile_page = profile_pages(:one)
  end

  test "visiting the index" do
    visit profile_pages_url
    assert_selector "h1", text: "Profile Pages"
  end

  test "creating a Profile page" do
    visit profile_pages_url
    click_on "New Profile Page"

    click_on "Create Profile page"

    assert_text "Profile page was successfully created"
    click_on "Back"
  end

  test "updating a Profile page" do
    visit profile_pages_url
    click_on "Edit", match: :first

    click_on "Update Profile page"

    assert_text "Profile page was successfully updated"
    click_on "Back"
  end

  test "destroying a Profile page" do
    visit profile_pages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Profile page was successfully destroyed"
  end
end
