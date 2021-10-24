class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def comfilm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.total_price = 0
    @order.postage = 800
    @order.order_staus = "waiting_for_payment"
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :postage, :total_price, :payment_method, :order_status, :customer_id)
  end
end
