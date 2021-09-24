class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find
  end 
end
