class Rental < ActiveRecord::Base
  belongs_to :product
  belongs_to :line_item
  validates_uniqueness_of :start_date, scope: :product_id

  delegate :name, to: :product, prefix: "product", allow_nil: true
end
