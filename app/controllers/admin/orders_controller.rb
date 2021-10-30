class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items

  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_item = @order.order_items
    if @order.order_status == "confirm"
      @order_item.update_all(order_item_status: "stay")
    end
    redirect_to admin_order_path(@order.id)
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
