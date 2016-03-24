class DashboardController < ApplicationController
  def index
    @products = Product.all
  end

  def admin
    @rentals = Rental.all
  end
end
