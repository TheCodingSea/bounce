class ReceiptMailer < ApplicationMailer
  default from: "receipts@empireeventsnj.com"

  def receipt_email sale
    @sale = sale
    @customer = @sale.customer
    @rental_location = @sale.rental_location
    mail(to: @customer.email, subject: "Your Receipt From Empire Events NJ")
  end
end
