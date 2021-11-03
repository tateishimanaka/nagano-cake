class Public::HomesController < ApplicationController

  def top
    @genres = Genre.all
    @get_items = Item.where(is_active: true)
    @items = @get_items.limit(4).order(" created_at DESC ")
  end

  def about
  end

end
