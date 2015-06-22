class OrderMailer < ApplicationMailer

  def confirm_email(order)
    @user = order.user
    @order = order
    mail(to: @user.email, subject: "您的订单 #{@order.number} 已经确认")
  end
end
