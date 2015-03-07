require 'test_helper'
require 'trail_list.rb'

class TrailListTest < ActionController::TestCase
  def setup
    @trail_list = TrailList.new("city", "food")
    @target_miles = 3
    @trail_list.instance_variable_set(:@lengths, [0, 3, 6, 8, 9, 14])
  end

  test "closest_match_trails" do
    result = @trail_list.closest_match_trails(@target_miles)
    assert_equal [0, 3, 6], result
  end

  test "included_trails" do
    # trail_list = TrailList.new("city", "food")
    # target_miles = 3
    # trail_list.instance_variable_set(:@lengths, [0, 3, 6, 8, 9, 14])

  end
end


# def included_trails
#   matches = closest_match_trails(target_miles)
#   included_trail_indices = []
#   trails = []
#   @lengths.each_with_index do |length, index|
#     if matches.include?(length)
#       included_trail_indices << index
#     end
#   end
#   included_trail_indices.each do |trail_index|
#     trails << {name: "#{@names[trail_index]}", length: "#{@lengths[trail_index]}", description: "#{@descriptions[trail_index]}",
#     activity_type: "#{@activity_types[trail_index]}", picture: "#{@thumbnails[trail_index]}"}
#   end
#   trails
# end
