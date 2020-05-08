require 'test_helper'

class OrganizationInvitationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization_invitation = organization_invitations(:one)
  end

  test "should get index" do
    get organization_invitations_url
    assert_response :success
  end

  test "should get new" do
    get new_organization_invitation_url
    assert_response :success
  end

  test "should create organization_invitation" do
    assert_difference('OrganizationInvitation.count') do
      post organization_invitations_url, params: { organization_invitation: {  } }
    end

    assert_redirected_to organization_invitation_url(OrganizationInvitation.last)
  end

  test "should show organization_invitation" do
    get organization_invitation_url(@organization_invitation)
    assert_response :success
  end

  test "should get edit" do
    get edit_organization_invitation_url(@organization_invitation)
    assert_response :success
  end

  test "should update organization_invitation" do
    patch organization_invitation_url(@organization_invitation), params: { organization_invitation: {  } }
    assert_redirected_to organization_invitation_url(@organization_invitation)
  end

  test "should destroy organization_invitation" do
    assert_difference('OrganizationInvitation.count', -1) do
      delete organization_invitation_url(@organization_invitation)
    end

    assert_redirected_to organization_invitations_url
  end
end
