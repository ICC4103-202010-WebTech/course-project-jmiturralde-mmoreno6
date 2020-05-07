require "application_system_test_case"

class MailBoxesTest < ApplicationSystemTestCase
  setup do
    @mail_box = mail_boxes(:one)
  end

  test "visiting the index" do
    visit mail_boxes_url
    assert_selector "h1", text: "Mail Boxes"
  end

  test "creating a Mail box" do
    visit mail_boxes_url
    click_on "New Mail Box"

    click_on "Create Mail box"

    assert_text "Mail box was successfully created"
    click_on "Back"
  end

  test "updating a Mail box" do
    visit mail_boxes_url
    click_on "Edit", match: :first

    click_on "Update Mail box"

    assert_text "Mail box was successfully updated"
    click_on "Back"
  end

  test "destroying a Mail box" do
    visit mail_boxes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mail box was successfully destroyed"
  end
end
