class CheckoutController < ApplicationController
  def cart
    @sale = Sale.includes(line_items: [:product, :rental]).find_by_id(session[:sale_id])
    if @sale && @sale.rental_location
      @rental_location = @sale.rental_location
    else
      @rental_location = RentalLocation.new()
    end
    @disabled = ((@sale && @sale.line_items.empty?) ? true : false)
  end

  def review_and_pay
    @sale = Sale.includes(line_items: [:product, :rental]).find_by_id(session[:sale_id])
    @sale.total!
    @rental_location = @sale.rental_location
  end

  def thank_you
    @sale = Sale.includes(line_items: [:product, :rental]).find_by_id(params[:sale_id])
    @rental_location = @sale.rental_location
  end
end
