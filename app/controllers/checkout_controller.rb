class CheckoutController < ApplicationController
  def new
    @sale = Sale.includes(line_items: [:product]).find_by_id(session[:sale_id])
  end
end
