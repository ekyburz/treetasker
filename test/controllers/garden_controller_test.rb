require "test_helper"

class GardenControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get garden_index_url
    assert_response :success
  end
end
