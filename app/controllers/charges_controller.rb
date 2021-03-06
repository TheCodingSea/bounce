class ChargesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  layout "application"

  def index
    @charges = Charge.all
  end

  def create
    #Amount must be in cents
    @amount = (current_sale.total * 100).to_i

    find_customer

    charge = Stripe::Charge.create(
      customer: @customer.customer_id,
      amount: @amount,
      description: "Rails Stripe Customer",
      currency: "usd"
    )

    @charge   = Charge.create(sale_id: session["sale_id"], charge_id: charge["id"],
                              amount: @amount, customer_id: @customer.id)
    @sale     = current_sale
    @sale.update(customer_id: @customer.id, completed_at: Time.now, closed: true)

    #FIXME send to Resque
    ReceiptMailer.receipt_email(@sale).deliver_now

    clear_current_sale
    redirect_to thank_you_path(sale_id: @sale.id)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to cart_path
  end

  private
  def find_customer
    found_customer = Customer.find_by_email params[:stripeEmail]
    if found_customer.nil?
      swipe_customer = Stripe::Customer.create(
        email:  params[:stripeEmail],
        source: params[:stripeToken]
      )
      @customer = Customer.create(customer_id: swipe_customer["id"], email: swipe_customer["email"])
    else
      @customer = found_customer
    end
  end
end
