class Public::ItemsController < ApplicationController

  def index
    @get_items = Item.where(is_active: true).order("id DESC")
    @items = @get_items.page(params[:page]).per(10)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

end
