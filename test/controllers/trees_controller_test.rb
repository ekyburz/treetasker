require "test_helper"

class TreesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get trees_show_url
    assert_response :success
  end

  test "should get new" do
    get trees_new_url
    assert_response :success
  end

  test "should get create" do
    get trees_create_url
    assert_response :success
  end
end
