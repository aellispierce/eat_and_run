class TrailList
  attr_reader :full_trail_list
  def initialize(city, food)
    @food= food
    @full_trail_list= HTTParty.get("https://outdoor-data-api.herokuapp.com/api.json?api_key=#{ENV['TRAIL_TOKEN']}&q[city_eq]=#{city}")
    @names = @full_trail_list["places"].map {|place| place["name"]}
    @lengths = @full_trail_list["places"].map {|place| parse(place["activities"], "length")}
    @descriptions = @full_trail_list["places"].map {|place| parse(place["activities"], "description")}
    @activity_types = @full_trail_list["places"].map {|place| parse(place["activities"], "activity_type_name")}
    @thumbnails = @full_trail_list["places"].map {|place| parse(place["activities"], "thumbnail")}
  end


  def parse(activities, attribute)
    result = activities.map do |a|
      if a[attribute].class == String && attribute != "thumbnail"
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

  def target_miles
    calories_per_mile = 90
    @food.average_calories/calories_per_mile
  end


  def closest_match_trails(target_miles)
    low_end = target_miles - 3
    high_end = target_miles + 3
    results = @lengths[0..-1].select {|length| length != nil && length >= low_end && length <= high_end}
    if results.count >= 1
      results
    else
      @lengths
    end
  end


  def included_trails
    matches = closest_match_trails(target_miles)
    included_trail_indices = []
    trails = []
    @lengths.each_with_index do |length, index|
      if matches.include?(length)
        included_trail_indices << index
      end
    end
    included_trail_indices.each do |trail_index|
      trails << {name: "#{@names[trail_index]}", length: "#{@lengths[trail_index]}", description: "#{@descriptions[trail_index]}",
      activity_type: "#{@activity_types[trail_index]}", picture: "#{@thumbnails[trail_index]}"}
    end
    trails
  end


  def as_json(options = {})

    {miles_needed: target_miles, trails: included_trails}

  end

end
