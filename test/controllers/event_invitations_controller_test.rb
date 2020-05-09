require 'test_helper'

class EventInvitationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_invitation = event_invitations(:one)
  end

  test "should get index" do
    get event_invitations_url
    assert_response :success
  end

  test "should get new" do
    get new_event_invitation_url
    assert_response :success
  end

  test "should create event_invitation" do
    assert_difference('EventInvitation.count') do
      post event_invitations_url, params: { event_invitation: {  } }
    end

    assert_redirected_to event_invitation_url(EventInvitation.last)
  end

  test "should show event_invitation" do
    get event_invitation_url(@event_invitation)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_invitation_url(@event_invitation)
    assert_response :success
  end

  test "should update event_invitation" do
    patch event_invitation_url(@event_invitation), params: { event_invitation: {  } }
    assert_redirected_to event_invitation_url(@event_invitation)
  end

  test "should destroy event_invitation" do
    assert_difference('EventInvitation.count', -1) do
      delete event_invitation_url(@event_invitation)
    end

    assert_redirected_to event_invitations_url
  end
end
