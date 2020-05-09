require "application_system_test_case"

class EventInvitationsTest < ApplicationSystemTestCase
  setup do
    @event_invitation = event_invitations(:one)
  end

  test "visiting the index" do
    visit event_invitations_url
    assert_selector "h1", text: "Event Invitations"
  end

  test "creating a Event invitation" do
    visit event_invitations_url
    click_on "New Event Invitation"

    click_on "Create Event invitation"

    assert_text "Event invitation was successfully created"
    click_on "Back"
  end

  test "updating a Event invitation" do
    visit event_invitations_url
    click_on "Edit", match: :first

    click_on "Update Event invitation"

    assert_text "Event invitation was successfully updated"
    click_on "Back"
  end

  test "destroying a Event invitation" do
    visit event_invitations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event invitation was successfully destroyed"
  end
end
