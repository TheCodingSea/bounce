class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_sale

  def set_current_sale(sale_id)
    session[:sale_id] = sale_id
  end

  def current_sale
    if session[:sale_id].nil?
      Sale.new
    else
      Sale.find(session[:sale_id])
    end
  end

  def clear_current_sale
    session[:sale_id] = nil
  end
end
