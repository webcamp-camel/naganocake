require 'test_helper'

class Admins::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get admins_home_top_url
    assert_response :success
  end

end
