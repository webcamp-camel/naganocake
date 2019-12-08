require 'test_helper'

class Admins::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admins_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_users_update_url
    assert_response :success
  end

end
