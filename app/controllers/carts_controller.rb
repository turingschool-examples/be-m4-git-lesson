class CartsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    redirect_to items_path
  end

  def show
    @items = @cart.contents.keys.map { |key| Item.find(key) }
  end
end