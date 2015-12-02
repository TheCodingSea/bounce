class CheckoutController < ApplicationController
  def new
    @sale = Sale.includes(line_items: [:product, :rental]).find_by_id(session[:sale_id])
  end
end
