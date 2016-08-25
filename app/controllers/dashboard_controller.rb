class DashboardController < ApplicationController
  before_action :authenticate_user!, only: [:admin]
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
