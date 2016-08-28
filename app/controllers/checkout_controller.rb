class CheckoutController < ApplicationController
  def cart
    @sale = Sale.includes(line_items: [:product, :rental]).find_by_id(session[:sale_id])
    #get_rental_location
    #@disabled = ((@sale && @sale.line_items.empty?) ? true : false)
  end

  def review_and_pay
    @sale = Sale.includes(line_items: [:product, :rental]).find_by_id(session[:sale_id])
    @sale.total!
    get_rental_location
    get_billing_address
  end

  def thank_you
    @sale = Sale.includes(line_items: [:product, :rental]).find_by_id(params[:sale_id])
    @rental_location = @sale.rental_location
  end

  private
  def get_rental_location
    if @sale&.rental_location
      @rental_location = @sale.rental_location
    else
      @rental_location = RentalLocation.new()
    end
  end

  def get_billing_address
    if @sale&.billing_address
      @billing_address = @sale.billing_address
    else
      @billing_address = BillingAddress.new()
    end
  end
end
