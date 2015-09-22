# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
FoodTruck.create(
  name: "Chicken & Rice Guys",
  description: "Food truck that specializes in chicken and lamb shawarma.",
  avg_rating: 4,
  location: "Harvard Square"
)

FoodTruck.create(
  name: "Banh Mi",
  description: "Food truck that specializes in Asian fusion-type foods.",
  avg_rating: 4,
  location: "South Station"
)

FoodTruck.create(
  name: "Mei Mei",
  description: "Food truck that serves creative Chinese-American cuisine made
  from locally sourced and sustainable ingredients.",
  avg_rating: 4,
  location: "Fenway"
)
