require 'test_helper'

class ProfilePagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile_page = profile_pages(:one)
  end

  test "should get index" do
    get profile_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_profile_page_url
    assert_response :success
  end

  test "should create profile_page" do
    assert_difference('ProfilePage.count') do
      post profile_pages_url, params: { profile_page: {  } }
    end

    assert_redirected_to profile_page_url(ProfilePage.last)
  end

  test "should show profile_page" do
    get profile_page_url(@profile_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_page_url(@profile_page)
    assert_response :success
  end

  test "should update profile_page" do
    patch profile_page_url(@profile_page), params: { profile_page: {  } }
    assert_redirected_to profile_page_url(@profile_page)
  end

  test "should destroy profile_page" do
    assert_difference('ProfilePage.count', -1) do
      delete profile_page_url(@profile_page)
    end

    assert_redirected_to profile_pages_url
  end
end
