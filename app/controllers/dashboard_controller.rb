class DashboardController < ApplicationController
  def index
    @products = Product.all
  end

  def admin
  end
end
