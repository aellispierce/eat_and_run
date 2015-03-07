require 'test_helper'
require 'trail_list.rb'
require 'food.rb'
#requires are for circle ci

class TrailListTest < ActionController::TestCase
  def setup
    @trail_list = TrailList.new("city", @food)
    @food_item = Food.new("potato")
    @target_miles = 3
    @food_item.instance_variable_set(:@calories, [350, 290, 300, 315])
    @trail_list.instance_variable_set(:@food, @food_item)
    @trail_list.instance_variable_set(:@lengths, [0, 7, 10, 6, 3])
    @trail_list.instance_variable_set(:@names, ["Falls Lake", "Eno River", "American Tobacco", "Ohmer Creek", "Blue River Campground"])
    @trail_list.instance_variable_set(:@descriptions, ["cold", "beautiful", "well-maintained", "crowded", "fun"])
    @trail_list.instance_variable_set(:@activity_types, ["hiking", "biking", "swimming", "camping", "canoeing"])
    @trail_list.instance_variable_set(:@thumbnails, ["url1", "url2", "url3", "url4", "url5"])
  end

  #this setup is so hairy...but when you do have a lot of little methods that call others, what else do you do?

  test "closest_match_trails" do
    result = @trail_list.closest_match_trails(@target_miles)
    assert_equal [0, 6, 3], result
  end

  test "included_trails" do
    result = @trail_list.included_trails
    assert_equal [{:name=>"Falls Lake", :length=>"0", :description=>"cold", :activity_type=>"hiking", :picture=>"url1"}, {:name=>"Ohmer Creek", :length=>"6", :description=>"crowded", :activity_type=>"camping", :picture=>"url4"}, {:name=>"Blue River Campground", :length=>"3", :description=>"fun", :activity_type=>"canoeing", :picture=>"url5"}], result
  end
end
