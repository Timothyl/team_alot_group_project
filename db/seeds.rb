# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
f = FoodTruck.create(
  name: "Chicken & Rice Guys",
  description: "Food truck that specializes in chicken and lamb shawarma.",
  avg_rating: 4,
  location: "Harvard Square"
)

# u = User.find(1)
#
# Review.create(
#   header: "Great food, simple menu!",
#   body: "This place rocks. Love to eat here every day. I probably shouldn't.",
#   rating: 5,
#   food_truck: f,
#   user: u
# )
