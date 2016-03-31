# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

products = Product.create([
                          {name: "Castle Bounce", price: 200, size: "13'W x 13'L x 16'H", description: lorem_ipsum},
                          {name: "Single Lane Slide", price: 400, size: "13'W x 24'W x 18'H", description: lorem_ipsum},
                          {name: "3 in 1 Bounce/Slide Combo", price: 300, size: "13'W x 26'L x 16'H", description: lorem_ipsum},
                          {name: "Obstacle Course", price: 600, size: "11'W x 65'L x 16'H", description: lorem_ipsum}])
