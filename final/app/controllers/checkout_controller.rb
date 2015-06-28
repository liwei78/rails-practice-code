class CheckoutController < ApplicationController
  def cart
    @cart_items = current_user.cart_items
  end

  # Cart => Checkout
  def checkout
    # OPTIMIZE
    items_params.each do |item|
      current_user.cart_items.update(item[0], quantity: item[1]["quantity"])
    end
    redirect_to address_path, notice: "确认你的收货地址"
  end

  # GET
  # Checkout => Address
  def address
    @address = current_user.address
  end

  # PATCH
  # Address => Confirm
  def confirm
    current_user.address.update(address_params)
    @order = Order.create(user: current_user, number: Time.zone.now.strftime("%y%m%d%H%M%S"), payment_state: "confirm")
    current_user.cart_items.each do |item|
      @order.line_items << LineItem.new(quantity: item.quantity, variant: item.variant)
    end
    current_user.cart_items.destroy
    redirect_to order_path(@order.number), notice: "订单已确认，请支付。"
  end

  # 点击支付按钮，跳转到支付宝页面
  def pay
    order = Order.find_by(number: params[:number])
    alipay_url = Alipay::Service.create_partner_trade_by_buyer_url(
      out_trade_no: order.number,
      subject: order.number,
      price: '10.00',
      quantity: 12,
      logistics_type: 'DIRECT',
      logistics_fee: '0',
      logistics_payment: 'SELLER_PAY',
      return_url: order_url(order.number),
      notify_url: notify_url
    )
    redirect_to alipay_url, notice: "应该跳转到支付页面"
  end

  # 实时到账交易成功，返回 TRADE_SUCCESS
  def notify
    notify_params = params.except(*request.path_parameters.keys)
    logger.info notify_params
    if Alipay::Notify.verify?(notify_params) and ['TRADE_FINISHED', 'TRADE_SUCCESS'].include?(notify_params[:trade_status])
      out_trade_no = notify_params[:out_trade_no]
      order = Order.find_by(number: out_trade_no) || raise(ActiveRecord::RecordNotFound)
      if order.payment_state == "confirm"
        order.update(payment_state: "paid")
      end
      render text: "success"
    else
      render text: "fail"
    end
  end

  private
    def address_params
      params.require(:address).permit(:state, :city, :address, :address2, :zipcode, :receiver, :phone)
    end

    def items_params
      params[:item].permit!
    end

end
