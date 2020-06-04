require 'test_helper'

class Admin::OrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_organization = admin_organizations(:one)
  end

  test "should get index" do
    get admin_organizations_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_organization_url
    assert_response :success
  end

  test "should create admin_organization" do
    assert_difference('Admin::Organization.count') do
      post admin_organizations_url, params: { admin_organization: {  } }
    end

    assert_redirected_to admin_organization_url(Admin::Organization.last)
  end

  test "should show admin_organization" do
    get admin_organization_url(@admin_organization)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_organization_url(@admin_organization)
    assert_response :success
  end

  test "should update admin_organization" do
    patch admin_organization_url(@admin_organization), params: { admin_organization: {  } }
    assert_redirected_to admin_organization_url(@admin_organization)
  end

  test "should destroy admin_organization" do
    assert_difference('Admin::Organization.count', -1) do
      delete admin_organization_url(@admin_organization)
    end

    assert_redirected_to admin_organizations_url
  end
end
