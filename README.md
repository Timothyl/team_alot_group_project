
[ ![Codeship Status for Timothyl/team_alot_group_project](https://codeship.com/projects/13d1a7d0-42b5-0133-0230-0a794f3732af/status?branch=master)](https://codeship.com/projects/103854)![Code Climate](https://codeclimate.com/github/Timothyl/team_alot_group_project.png) [![Coverage Status](https://coveralls.io/repos/Timothyl/team_alot_group_project/badge.svg?branch=master&service=github)](https://coveralls.io/github/Timothyl/team_alot_group_project?branch=master)

# Food Truck Reviewer #

*This app is designed to allow registered users to submit their favorite food
trucks to a database which can be reviewed by other registered users. Given a
food truck's Twitter user name, it also pulls the food truck's most recent
original tweet, so that users can determine the food truck's current location.*

## Live App Address ##

Visit https://food-truck-reviewer.herokuapp.com/

## Installation ##

1. Clone the repository to your local machine.
2. Run `bundle install`.
3. Set up the food truck database with `rake db:create`.
4. (OPTIONAL) If example food trucks are wanted, a seed file is provided. Run
  `rake db:seed`.
5. To start the server, run `rails server`.
6. Website will be available on `localhost:3000`.

## How to run the test suite ##

Run `rspec`.
