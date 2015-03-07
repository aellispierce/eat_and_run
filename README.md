#EAT AND RUN

Find it here:https://eatandrun.herokuapp.com/api/v1/trails

Eat and Run is an API that takes two basic parameters: a food and your location.

The app will then return the top five item/brand/calorie food matches, and average those calories.

Relevant options for nearby trails are displayed below--trails near your location are selected based on the closest match of trail length and the amount of calories that need to be burned off.

Trail information includes the trail length, description, various activities, and a link to a picture.

The vision for an app's UI would be: enter the food you just ate, and see a snapshot of a leafy local trail.  Now working off your food isn't a chore...it is as enticing as your meal.

We are utilizing two APIs:
Nutritionix  https://www.mashape.com/msilverman/nutritionix-nutrition-database
TrailAPI  https://www.mashape.com/trailapi/trailapi

In our calculation of calories eaten vs. miles to walk, we are using the rough estimate of 90 calories burned per mile walked.


#SEARCH PARAMETERS

Use the following format:https://eatandrun.herokuapp.com/api/v1/trails?city={CITY}&food={FOOD}

Enter the city (no state) with the first letter capitalized.  Enter a food item (no spaces). Do not include the brackets.  

If no food is specified, a random food will be chosen.  If no city is selected, the first 100 trails will be displayed.

#TYPICAL DATA RECORD

For a search like https://eatandrun.herokuapp.com/api/v1/trails?city=Durham&food=cake

```
{
  "food": {

    "items": [
      {
          "name": "Cake, yellow, commercially prepared, with vanilla frosting - 1 serving",
          "brand": "USDA",
          "calories": "261.97"
      },
      {
          "name": "Cake, yellow, commercially prepared, with vanilla frosting - 1 oz",
          "brand": "USDA",
          "calories": "110.85"
      },
      {
          "name": "Cake",
          "brand": "Creative Occassions",
          "calories": "320"
      },
      {
          "name": "Cake",
          "brand": "Tully's Coffee",
          "calories": "240"
      },
      {
          "name": "Cake Decoration, Edible",
          "brand": "Cake Mate",
          "calories": "10"
      }
    ],
    "average_calories": 85.641
  },
  "trail": {
      "miles_needed": 0.9515666666666667,
      "trails": [
        {
          "name": "East Foss Farm",
          "length": "3.0",
          "description": "This is a great trail network for beginners to intermediate riders. several trails are featured and each has a gently rolling grade with turns and gentle dips. forest scenery dominates on this property which is part of the university of new hampshire's forestry research studies. beautiful towering oak and pine trees, meadows, and brooks criss cross the property. the trail networks are expansive, plan on spending several hours enjoying some choice off road biking., East foss farm features 3 miles of hiking trails near durham, nh., and This is an easy 3 mile doubletrack trail through the woods that may intersect with other trails along the way.",
          "activity_type": "Mountain biking, Hiking, and Snow sports",
          "picture": "Http://images.singletracks.com/2010/10/east-foss-farm-5-0.jpg"
        },
        {
          "name": "Falls Lake",
          "length": "0.0",
          "description": "This 12,500-acre lake is located within a 30-minute drive from raleigh and durham.  boat launching, public marina, swim beach and picnic facilities are available.  recreation facilities are operated by the north carolina state parks.",
"activity_type": "Camping",
"picture": ""
        },
        {
          "name": "Freeport / Durham Koa",
          "length": "0.0",
          "description": "Explore beautiful  freeport, maine  from your  closest koa campground, just 6 miles away.  you can enjoy excellent savings (see our &amp;amp;#39;hot deals&amp;amp;#39;) on early spring and late fall camping, as well as specials on monthly or seasonal stays. we are  situated on 50 acres , so enjoy our spacious sites; completely wooded for the back to nature feel, tree-lined and nestled in the woods, or wide-open pull throughs. rest in our one or two bedroom cabins, each with a refrigerator, microwave, and heaters, or try our rv rentals with full kitchen and bath.   we invite you to socialize by enjoying our playground, horseshoe pits, basketball or beach volleyball courts, baseball field and game room, or take a refreshing dip in our  pool and waterslides.  we also have  pony rides ! we welcome groups, (rallies, reunions, weddings, etc.) which includes the use of the recreation hall with kitchen and/or pavilion. additionally, we have planned activities, pancake breakfasts, and ice cream socials every weekend! do not miss out on our  special &amp;quot;theme weekends&amp;quot;,  like christmas in july, haunted weekend in august and hawaiian luau in september, to name a few!  there&amp;amp;#39;s never a shortage of activities for our guests here at the freeport koa. if nature is your passion, you may explore one of our  half mile nature trails . we welcome you to enjoy our clean, remodeled facilities as you take advantage of the over 101 things to do within a 50 mile radius of freeport, including the  famous ll bean,  open 24-hours a day, 7 days a week. as always, we believe you will find everything you have come to expect from a koa.",
"activity_type": "Camping",
"picture": "Http://images.tripleblaze.com/2011/05/5949-1304555619-0.jpg"
        },
        {
          "name": "Eno River State Park",
          "length": "0.0",
          "description": "Find solitude and peace among tall trees and a symphony of forest creatures camping at eno river state park. the park has backcountry camping available to families, individuals, and groups at the fews ford and cole mill accesses. all sites require hiking in and supplies must be carried in. there is not a potable water source at the sites.",
"activity_type": "Camping",
"picture": ""
          },
          {
            "name": "Occoneechee Mountain State Natural Area",
            "length": "3.0",
            "description": "Amazing pocket of nature near the nexis of i-85 and i-40.  you may have seen the mountain with the tower on top near the interstate but you really have to hike around to really appreciate the area.  wide gravel road leads to the top with several hiking trails to take you beside the river and small fishing ponds.  be sure to check out the overlook, a nearly shear cliff face that is probably 100-200 feet high.  top elevation is 867 feet.",
"activity_type": "Hiking",
"picture": "Http://images.tripleblaze.com/2009/02/3-1220646639.jpg"
          }
        ]
    }
}```
