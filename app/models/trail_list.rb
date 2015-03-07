class TrailList
  attr_reader :full_trail_list
  def initialize(city, food)
    @food= food
    @full_trail_list= HTTParty.get("https://outdoor-data-api.herokuapp.com/api.json?api_key=#{ENV['TRAIL_TOKEN']}&q[city_eq]=#{city}")
  end

  def parse(activities, attribute)
    result = activities.map do |a|
      if a[attribute].class == String
       a[attribute].capitalize
     else
       a[attribute]
     end
    end
    result= result.reject{ |r| r == nil}
    if attribute == "length"
      result[0]
    else
      result.to_sentence
    end
  end

  def trails
    names = @full_trail_list["places"].map {|place| place["name"]}
    lengths = @full_trail_list["places"].map {|place| parse(place["activities"], "length")}
    descriptions = @full_trail_list["places"].map {|place| parse(place["activities"], "description")}
    activity_types = @full_trail_list["places"].map {|place| parse(place["activities"], "activity_type_name")}
    thumbnails = @full_trail_list["places"].map {|place| parse(place["activities"], "thumbnail")}

    trails= []
    names[0..4].each_with_index do |name, index|
      trails << "Name: #{name}  \n Length: #{lengths[index]} \n Description: #{descriptions[index]} \n" +
      "Activity Type: #{activity_types[index]}\n Picture: #{thumbnails[index]}\n"
    end
    trails
  end

  def closest_match_trails(target_miles)
    low_end = target_miles - 3
    high_end = target_miles + 3
    results = trail_lengths_array.select {|length|  length > low_end && length < high_end}
    if results.length >= 1
      results
    else
      @lengths
    end
  end

  def target_miles
    calories_per_mile = 90
    @food.average_calories/calories_per_mile
  end

  def as_json(options = {})
    {trails: trails, target: target_miles}
  end

end

# def trails
#   names = @full_trail_list["places"].map {|place| place["name"]}
#   @lengths = @full_trail_list["places"].map {|place| parse_length(place["activities"])}
#   descriptions = @full_trail_list["places"].map {|place| parse_description(place["activities"])}
#   activity_types = @full_trail_list["places"].map {|place| parse_activity_type(place["activities"])}
#   thumbnails = @full_trail_list["places"].map {|place| parse_thumbnail(place["activities"])}
#
#   trails= []
#   lengths[0..4].each_with_index do |length, index|
#     if length > 5
#       trails << "Name: #{names[index]}  \n Length: #{length} \n Description: #{descriptions[index]} \n" +
#       "Activity Type: #{activity_types[index]}\n Picture: #{thumbnails[index]}\n"
#     end
#   end
#   trails
# end
# def included_lengths
#   matches= closest_match_trails(target_miles)
#   @lengths.each_with_index do |length, index|
#     if matches.include?(length)
#       included_trail_indices << index
#     end
#     included_trail_indices.each do |index|
#       name[index] length[index] description[index]
#     end
#   end
