class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def comfilm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    @order.total_price = 0
      @cart_items.each do |cart_item|
        @order.total_price += cart_item.subtotal
      end
    @order.postage = 800
    @order.order_status = "waiting_for_payment"
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items

    @cart_items.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.amount = cart_item.amount
      @order_item.price = cart_item.item.add_tax_price
      @order_item.order_item_status = "impossible"
      @order_item.item_id = cart_item.item_id
      @order_item.order_id = @order.id
      @order_item.save
    end
    @cart_items.destroy_all
    redirect_to order_complete_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :postage, :total_price, :payment_method, :order_status, :customer_id)
  end

end
