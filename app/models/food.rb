class Food
  attr_reader :food_info, :average_calories
  def initialize(food)

    @food = food
    @food_info = HTTParty.get("https://api.nutritionix.com/v1_1/search/#{food}?results=0:20&fields=item_name,brand_name,item_id,nf_calories&appId=#{ENV['NUTRITIONIX_ID']}&appKey=#{ENV['NUTRITIONIX_TOKEN']}")

  end

  def items
    item = []
    item_names = @food_info["hits"].map {|hit| hit["fields"]["item_name"]}
    brand_names = @food_info["hits"].map {|hit| hit["fields"]["brand_name"]}
    @calories = @food_info["hits"].map {|hit| hit["fields"]["nf_calories"]}

    item_names[0..4].each_with_index do |name, index|
      item << {name: "#{name}", brand: "#{brand_names[index]}", calories: "#{@calories[index]}"}
    end
    item
  end

  def average_calories
    num_calories = @calories.count
    return 0 if num_calories == 0
    (@calories.reduce(:+))/num_calories
  end

  def as_json(options = {})
    {items: items, average_calories: average_calories}
  end

end
