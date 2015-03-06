class Food
  attr_reader :food_info
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
      item << "Name: #{name}  \n Brand: #{brand_names[index]} \n Calories: #{@calories[index]}"
    end
    item
  end

  def average_calories
    num_calories = @calories.count
    (@calories.reduce(:+))/num_calories
  end

  def as_json(options = {})
    {items: items, average_calories: average_calories}
  end

end
