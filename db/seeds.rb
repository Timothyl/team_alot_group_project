# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

foodtrucks = [
  ["Chicken & Rice Guys", "Food truck that specializes in
  chicken and lamb shawarma.", 4, "Harvard Square", "cnrguys"],
  ["Bon Me", "Food truck that specializes
  in Asian fusion-type foods.", 4, "South Station", "bonme"],
  ["Mei Mei", "Food truck that serves creative Chinese-American
  cuisine made from locally sourced and sustainable ingredients.",
  4, "Fenway", "meimeiboston"],
  ["Clover", "Food truck that specializes in local, organic,
    vegetarian-friendly food.", 4, "South Station", "cloverfoodtruck"],
  ["Roxy's Gourmet Grilled Cheese", "Cheery spin-off of popular
    food truck with inventive grilled cheese sandwiches, poutine and
    burgers.", 4, "South End", "RoxysGrilledChz"],
  ["Cookie Monstah", "Food truck serving homemade cookies with all natural
    ingredients and homemade ice cream sandwiches.", 4, "The Greenway
    Carousel", "MonstahTruck"],
  ["Tenoch Móvil", "Dispenses traditional Mexican chow & beverages.", 4,
  "Financial District", "TenochMexican"],
  ["Wow Barbecue", "Food truck serving Chinese BBQ meat
    skewers & unique dishes.", 4, "Boylston St", "iloveWOWbbq"],
  ["The Bacon Truck", "The natural evolution (lovechild?) of America's dual,
    unrelenting fascination with bacon and food trucks.", 4, "Prudential
    Center", "BaconTruckBOS"],
  ["Stoked Wood Fired Pizza", "Boston's first and only food truck selling
    wood-fired pizza.", 4, "Boylston St", "StokedPizza"]
]
foodtrucks.each do |foodtruck|
  name, description, avg_rating, location, twitter = foodtruck
  f = FoodTruck.find_or_create_by!(name: name, description: description,
    avg_rating: avg_rating, location: location, twitter: twitter)

  (1..10).to_a.each do |n|
    Review.find_or_create_by!(header: "#{n}. This is a review header",
                              body: "#{n}. This is a review body.
                              I am typing this because we need a minimum
                              charcter count",
                              rating: (2..5).to_a.sample,
                              food_truck: f)
  end
end

User.create(email: ENV['admin_email'], password: ENV['admin_pass'], admin: true)
