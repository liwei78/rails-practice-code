class CheckoutController < ApplicationController
  def cart
    @cart_items = current_user.cart_items
  end

  # Cart => Checkout
  def checkout
    redirect_to address_path, notice: "确认你的收货地址"
  end

  # Checkout => Address
  def address
    @address = current_user.address
  end

  # Address => Confirm
  def confirm
    @order = Order.create(user: current_user, number: Time.zone.now.strftime("%y%m%d%H%M%S"))
    redirect_to order_path(@order.number), notice: "订单已确认，请支付。"
  end

  # 点击支付按钮，跳转到支付宝页面
  def pay
    redirect_to root_path, notice: "应该跳转到支付页面"
  end

  # 实时到账交易成功，返回 TRADE_SUCCESS
  def notify
    notify_params = params.except(*request.path_parameters.keys)
    logger.info notify_params
    if Alipay::Notify.verify?(notify_params) and ['TRADE_FINISHED', 'TRADE_SUCCESS'].include?(notify_params[:trade_status])
      out_trade_no = notify_params[:out_trade_no]
      payment = Spree::Payment.find_by(number: out_trade_no) || raise(ActiveRecord::RecordNotFound)
      unless payment.completed?
        payment.complete!
        payment.order.update_attributes(state: "complete")
        payment.order.finalize!
      end
      render text: "success"
    else
      render text: "fail"
    end
  end

end
