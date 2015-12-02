class Rental < ActiveRecord::Base
  belongs_to :product
  belongs_to :line_item
end
