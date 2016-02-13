class LineItem < ActiveRecord::Base
  belongs_to :sale
  belongs_to :product
  has_one :rental

  delegate :price, to: :product, prefix: "product"

  #validates_presence_of :sale_id
end
