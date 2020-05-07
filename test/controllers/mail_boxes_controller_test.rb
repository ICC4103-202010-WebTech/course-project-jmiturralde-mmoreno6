require 'test_helper'

class MailBoxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mail_box = mail_boxes(:one)
  end

  test "should get index" do
    get mail_boxes_url
    assert_response :success
  end

  test "should get new" do
    get new_mail_box_url
    assert_response :success
  end

  test "should create mail_box" do
    assert_difference('MailBox.count') do
      post mail_boxes_url, params: { mail_box: {  } }
    end

    assert_redirected_to mail_box_url(MailBox.last)
  end

  test "should show mail_box" do
    get mail_box_url(@mail_box)
    assert_response :success
  end

  test "should get edit" do
    get edit_mail_box_url(@mail_box)
    assert_response :success
  end

  test "should update mail_box" do
    patch mail_box_url(@mail_box), params: { mail_box: {  } }
    assert_redirected_to mail_box_url(@mail_box)
  end

  test "should destroy mail_box" do
    assert_difference('MailBox.count', -1) do
      delete mail_box_url(@mail_box)
    end

    assert_redirected_to mail_boxes_url
  end
end
