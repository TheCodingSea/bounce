class Sale < ActiveRecord::Base
  has_many :line_items
  has_one :rental_location
  has_many :charges
  belongs_to :customer

  def total!
    set_subtotal!
    set_tax!
    set_total!
    self.save
  end

  private
  def set_subtotal!
    self.subtotal = self.line_items.collect { |li| li.product_price }.inject(:+)
  end

  def set_tax!
    self.tax = self.subtotal * 0.07
  end

  def set_total!
    self.total = self.subtotal + self.tax
  end
end
