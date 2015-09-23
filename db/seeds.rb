# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

foodtrucks = [
    ["Chicken & Rice Guys", "Food truck that specializes in
      chicken and lamb shawarma.", 4, "Harvard Square"],
    ["Banh Mi", "Food truck that specializes
      in Asian fusion-type foods.", 4, "South Station"],
    ["Mei Mei", "Food truck that serves creative Chinese-American
      cuisine made
    from locally sourced and sustainable ingredients.", 4, "Fenway"]
]


foodtrucks.each do |foodtruck|
  name, description, avg_rating, location = foodtruck
  f = FoodTruck.find_or_create_by!(name: name, description: description,
    avg_rating: avg_rating, location: location)
  Review.find_or_create_by!(header: "This is a review header",
   body: "This is a review body.
   I am typing this because we need a minimum charcter count", rating: 3,
   food_truck: f)
  Review.find_or_create_by!(header: "2This is a review header",
   body: "2This is a review body.
   I am typing this because we need a minimum charcter count", rating: 3,
   food_truck: f)
  Review.find_or_create_by!(header: "3This is a review header",
   body: "3This is a review body.
   I am typing this because we need a minimum charcter count", rating: 3,
   food_truck: f)
  Review.find_or_create_by!(header: "4This is a review header",
   body: "4This is a review body.
   I am typing this because we need a minimum charcter count", rating: 3,
   food_truck: f)
   Review.find_or_create_by!(header: "5This is a review header",
    body: "5This is a review body.
    I am typing this because we need a minimum charcter count", rating: 3,
    food_truck: f)
end
