# README
# NutritionAPI
This project is coded in Ruby using Ruby on Rails framework.

To run the project run the following command in the terminal:
### rails s -p 5000   

To create a new food item in the database use a post request on the following endpoint:
### http://localhost:5000/food_items
the request should like the following format:
### {
###    "food_item":{
###        "name": "Chicken Sandwich",
###        "calories": 340,
###        "serving": 150,
###        "picture": "copy base64 image"
###    },
###    "email": "admin@admin.com",
###    "password": "admin"
### }
for any image that you want to use, you need to convert it first to base64 format from the following website: https://easy64.org/convert-file-to-base64/ , afterwards copy the result into the picture field above.
the admin and password fielad are the manually created admin's credentials (not using them would result in an error).
