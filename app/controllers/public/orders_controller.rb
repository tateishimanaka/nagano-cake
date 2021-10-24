class Public::OrdersController < ApplicationController
  def new  
    @order = Order.new(params[:id])
  end
  
  def comfilm
    
  end
  
  
end
