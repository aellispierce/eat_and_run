require 'test_helper'

class Api::V1::TrailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "index should have trails" do
    get :index
    result = JSON.parse(response.body)
    num_results = result["trail"]["trails"].length
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
    refute(result["trail"]["trails"].include?("places"))
  end

  test "trails should have name and length" do
    get :index
    result = JSON.parse(response.body)
    assert(result["trail"]["trails"].first.include?("name"))
    assert(result["trail"]["trails"].first.include?("length"))
  end

  test "food should have average calories" do
    get :index, :params => { :food => 'cupcake' }
    result = JSON.parse(response.body)
    assert(result["food"].include?("average_calories"))
  end
end
