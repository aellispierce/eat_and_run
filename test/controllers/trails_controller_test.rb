require 'test_helper'

class Api::V1::TrailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  # test "index should have trails" do
  #   get :index
  #   assert_response :success
  #   response = JSON.parse(response.body)
  #   response["full_trail_list"]["places"].length
  #   assert json.length > 0
  # end
end
