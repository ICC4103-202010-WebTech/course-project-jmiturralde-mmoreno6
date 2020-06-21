require "application_system_test_case"

class SendMessagesTest < ApplicationSystemTestCase
  setup do
    @send_message = send_messages(:one)
  end

  test "visiting the index" do
    visit send_messages_url
    assert_selector "h1", text: "Send Messages"
  end

  test "creating a Send message" do
    visit send_messages_url
    click_on "New Send Message"

    click_on "Create Send message"

    assert_text "Send message was successfully created"
    click_on "Back"
  end

  test "updating a Send message" do
    visit send_messages_url
    click_on "Edit", match: :first

    click_on "Update Send message"

    assert_text "Send message was successfully updated"
    click_on "Back"
  end

  test "destroying a Send message" do
    visit send_messages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Send message was successfully destroyed"
  end
end
