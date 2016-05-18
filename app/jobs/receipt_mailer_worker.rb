class ReceiptMailerWorker
  @queue = :receipt_queue

  def self.perform(sale_id)
    begin
      puts "Sending Email..."
      sale = Sale.find sale_id
      ReceiptMailer.receipt_email(sale).deliver_now
    rescue Exception => ex
      puts "Failed to send: #{ex}"
      puts ex.backtrack.join("\n\t")
      Bugsnag.notify(ex)
    end
  end
end
