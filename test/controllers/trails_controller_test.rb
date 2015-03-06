require 'test_helper'

class Api::V1::TrailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "index should have trails" do
    get :index
    assert_response :success
    result = JSON.parse(response.body)
    result["trail"]["full_trail_list"]["places"].length
    assert result.length > 0
  end
end
