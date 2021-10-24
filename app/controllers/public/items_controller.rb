class Public::ItemsController < ApplicationController

  def index
    @get_items = Item.where(is_active: true)
    @items = @get_items.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end

end
