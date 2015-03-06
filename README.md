#EAT AND RUN

Find it here:https://eatandrun.herokuapp.com/

Eat and Run is an API that takes two basic parameters: the food you want to eat and your location
The app will then return relevant options for nearby trails where you can burn off the calories.

The vision for an app's UI would be: enter the food you just ate, and see a snapshot of a leafy local trail.  Now working off your food isn't a chore...it is as enticing as your meal.

We will utilize two APIs:
Nutritionix  https://www.mashape.com/msilverman/nutritionix-nutrition-database
TrailAPI  https://www.mashape.com/trailapi/trailapi

In our calculation of calories eaten vs. miles to walk, we are using the rough estimate of 90 calories burned per mile walked.


#MINIMUM VIABLE PRODUCT

-User enters
FOOD: "cheesecake"
CITY: "Durham"

-API returns

Food:"Cheesecake"
Calories:"536"  

Trails:"Little River Regional Park"
       "Duke Forest"
       "Eno River State Park"
