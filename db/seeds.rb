# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

products = Product.create([
                          {name: "Castle Bounce", price: 200, description: "13'W x 13'L x 16'H"},
                          {name: "Single Lane Slide", price: 400, description: "13'W x 24'W x 18'H Can be used wet or dry."},
                          {name: "3 in 1 Bounce/Slide Combo", price: 300, description: "13'W x 26'L x 16'H"},
                          {name: "Obstacle Course", price: 600, description: "11'W x 65'L x 16'H"}])
