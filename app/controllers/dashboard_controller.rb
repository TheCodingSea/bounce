class DashboardController < ApplicationController
  def index
    @products = Product.all
    @carousel = CarouselImage.all
  end

  def admin
    @rentals = Rental.all.includes(:product, :line_item)
  end

  def terms_and_conditions
  end

  def privacy_policy
  end
end
