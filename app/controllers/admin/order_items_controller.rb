class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    @order = @order_item.order
    if @order_item.order_item_status == "make"
      @order.update(order_status: "make")
    elsif @order.order_items.count == @order.order_items.where(order_item_status: "finish").count
      @order.update(order_status: "ready_to_ship")
    end
    redirect_to admin_order_path(@order_item.order)
  end

  def order_item_params
    params.require(:order_item).permit(:order_item_status)
  end
end
