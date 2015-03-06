class TrailList
  attr_reader :full_trail_list
  def initialize(city)
    @full_trail_list= HTTParty.get("https://outdoor-data-api.herokuapp.com/api.json?api_key=#{ENV['TRAIL_TOKEN']}&q[city_eq]=#{city}")
  end

  def parse(activities)
    length = activities.map do |a|
       a["length"]
    end
    length[0]
  end

  def trails
    trail_names = @full_trail_list["places"].map {|place| place["name"]}
    trail_length = @full_trail_list["places"].map {|place| parse(place["activities"])}
    trails= []
    trail_names[0..4].each_with_index do |name, index|
      trails << "Name: #{name}  \n Length: #{trail_length[index]}"
    end
    trails
  end

  def as_json(options = {})
    {trails: trails}
  end

end
