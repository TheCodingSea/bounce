class Sale < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_one :rental_location, dependent: :destroy
  has_many :charges
  belongs_to :customer

  def calculate_subtotal
    self.subtotal = self.line_items.collect { |li| li.product_price }.inject(:+) || 0
  end

  def calculate_tax
    begin
      self.calculate_subtotal if !self.subtotal
      self.tax = self.subtotal * 0.07
    rescue
      0
    end
  end

  def calculate_total
    begin
      self.calculate_subtotal if !self.subtotal
      self.calculate_tax if !self.tax
      self.total = self.subtotal + self.tax
    rescue
      0
    end
  end

  def calculate_total_before_delivery
    begin
      self.calculate_total if !self.total
      self.total * 0.1
    rescue
      0
    end
  end

  def total!
    calculate_subtotal
    calculate_tax
    calculate_total
    self.save
  end
end
