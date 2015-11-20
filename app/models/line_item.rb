class LineItem < ActiveRecord::Base
  belongs_to :sale
  belongs_to :product

  #validates_presence_of :sale_id
end
