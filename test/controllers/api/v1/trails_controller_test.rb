require 'test_helper'

module Api
 module V1
   class TrailsControllerTest < ActionController::TestCase
      test "should get index" do
        get :index
        assert_response :success
      end

      test "index should have trails" do
        get :index
        assert_response :success
        result = JSON.parse(response.body)
        num_results = result["trail"]["full_trail_list"]["places"].length
        assert num_results > 0
      end

      test "index should have foods" do
        get :index
        assert_response :success
        result = JSON.parse(response.body)
        num_results= result["food"]["food_info"]["hits"].length
        assert num_results > 0
      end
    end
  end
end
