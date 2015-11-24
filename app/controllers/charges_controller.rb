class ChargesController < ApplicationController
  def new
  end

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

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
