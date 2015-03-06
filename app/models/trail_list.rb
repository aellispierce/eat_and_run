class TrailList
  attr_reader :full_trail_list
  def initialize(city)
    @full_trail_list= HTTParty.get("https://outdoor-data-api.herokuapp.com/api.json?api_key=#{ENV['TRAIL_TOKEN']}&q[city_eq]=#{city}")
  end

  def parse_length(activities)
    length = activities.map do |a|
       a["length"]
    end
    length[0]
  end
  def parse_description(activities)
    description = activities.map do |a|
      a["description"]
    end
    description[0]
  end

  def parse_activity_type(activities)
    type = activities.map do |a|
      a["activity_type_name"].capitalize
    end
    type[0]
  end

  def parse_thumbnail(activities)
    type = activities.map do |a|
      a["thumbnail"]
    end
    type[0]
  end

  def trails
    names = @full_trail_list["places"].map {|place| place["name"]}
    lengths = @full_trail_list["places"].map {|place| parse_length(place["activities"])}
    descriptions = @full_trail_list["places"].map {|place| parse_description(place["activities"])}
    activity_types = @full_trail_list["places"].map {|place| parse_activity_type(place["activities"])}
    thumbnails = @full_trail_list["places"].map {|place| parse_thumbnail(place["activities"])}

    trails= []
    names[0..4].each_with_index do |name, index|
      trails << "Name: #{name}  \n Length: #{lengths[index]} \n Description: #{descriptions[index]} \n" +
      "Activity Type: #{activity_types[index]}\n Picture: #{thumbnails[index]}\n"
    end
    trails
  end

  def as_json(options = {})
    {trails: trails}
  end

end
