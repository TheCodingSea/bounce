class ChargesController < ApplicationController
  def create
    puts 'XXXXXXXXXXXXXXXXXXXXXXX'
    pp params
    puts 'XXXXXXXXXXXXXXXXXXXXXXX'
    #Amount must be in cents
    @amount = (current_sale.total * 100).to_i
    puts 'XXXXXXXXXXXXXXXXXXXXXXX'
    pp @amount
    puts 'XXXXXXXXXXXXXXXXXXXXXXX'

    customer = Stripe::Customer.create(
      email:  params[:stripeEmail],
      source: params[:stripeToken]
    )
    puts 'XXXXXXXXXXXXXXXXXXXXXXX'
    pp customer
    puts 'XXXXXXXXXXXXXXXXXXXXXXX'

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "Rails Stripe Customer",
      currency: "usd"
    )
    puts 'XXXXXXXXXXXXXXXXXXXXXXX'
    pp charge
    puts 'XXXXXXXXXXXXXXXXXXXXXXX'

    @customer = Customer.create(customer_id: customer["id"], email: customer["email"])
    @charge   = Charge.create(sale_id: session["sale_id"], charge_id: charge["id"],
                              amount: @amount, customer_id: @customer.id)
    @sale     = current_sale
    @sale.update(customer_id: @customer.id)
    #FIXME send email
    clear_current_sale
    redirect_to thank_you_path(sale_id: @sale.id)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to review_and_pay_path
  end
end
