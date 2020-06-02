require "application_system_test_case"

class UserVotesTest < ApplicationSystemTestCase
  setup do
    @user_vote = user_votes(:one)
  end

  test "visiting the index" do
    visit user_votes_url
    assert_selector "h1", text: "User Votes"
  end

  test "creating a User vote" do
    visit user_votes_url
    click_on "New User Vote"

    click_on "Create User vote"

    assert_text "User vote was successfully created"
    click_on "Back"
  end

  test "updating a User vote" do
    visit user_votes_url
    click_on "Edit", match: :first

    click_on "Update User vote"

    assert_text "User vote was successfully updated"
    click_on "Back"
  end

  test "destroying a User vote" do
    visit user_votes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User vote was successfully destroyed"
  end
end
