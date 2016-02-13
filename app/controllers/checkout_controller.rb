class CheckoutController < ApplicationController
  def cart
    @sale = Sale.includes(line_items: [:product, :rental]).find_by_id(session[:sale_id])
    if @sale && @sale.rental_location
      @rental_location = @sale.rental_location
    else
      @rental_location = RentalLocation.new()
    end
  end

  def review_and_pay
    @sale = Sale.includes(line_items: [:product, :rental]).find_by_id(session[:sale_id])
    @rental_location = @sale.rental_location
  end

  def thank_you
  end
end
