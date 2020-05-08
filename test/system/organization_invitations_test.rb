require "application_system_test_case"

class OrganizationInvitationsTest < ApplicationSystemTestCase
  setup do
    @organization_invitation = organization_invitations(:one)
  end

  test "visiting the index" do
    visit organization_invitations_url
    assert_selector "h1", text: "Organization Invitations"
  end

  test "creating a Organization invitation" do
    visit organization_invitations_url
    click_on "New Organization Invitation"

    click_on "Create Organization invitation"

    assert_text "Organization invitation was successfully created"
    click_on "Back"
  end

  test "updating a Organization invitation" do
    visit organization_invitations_url
    click_on "Edit", match: :first

    click_on "Update Organization invitation"

    assert_text "Organization invitation was successfully updated"
    click_on "Back"
  end

  test "destroying a Organization invitation" do
    visit organization_invitations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Organization invitation was successfully destroyed"
  end
end
