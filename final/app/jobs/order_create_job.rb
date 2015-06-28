class OrderCreateJob < ActiveJob::Base
  queue_as :default

  def perform(order)
    OrderMailer.confirm_email(order).deliver_later
  end
end
