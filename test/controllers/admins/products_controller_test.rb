require 'test_helper'

class Admins::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_products_index_url
    assert_response :success
  end

  test "should get new" do
    get admins_products_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_products_create_url
    assert_response :success
  end

  test "should get show" do
    get admins_products_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_products_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_products_update_url
    assert_response :success
  end

end
