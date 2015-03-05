class Food
  attr_reader :food_info
  def initialize(food)
    @food_info = HTTParty.get("https://api.nutritionix.com/v1_1/search/#{food}?results=0:20&fields=item_name,brand_name,item_id,nf_calories&appId=#{ENV['NUTRITIONIX_ID']}&appKey=#{ENV['NUTRITIONIX_TOKEN']}")
  end

end
