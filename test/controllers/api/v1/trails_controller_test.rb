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
        result = JSON.parse(response.body)
        num_results = result["trail"]["full_trail_list"]["places"].length
        assert num_results > 0
      end

      test "index should have foods" do
        get :index
        result = JSON.parse(response.body)
        num_results= result["food"]["items"].length
        assert num_results > 0
      end

      test "food should not have excess data" do
        get :index
        result = JSON.parse(response.body)
        refute(result["food"].include?("food_info"))
      end

      test "trails should not have excess data" do
        get :index
        result = JSON.parse(response.body)
        refute(result["trail"]["full_trail_list"].include?("places"))

      end

    end
  end
end
