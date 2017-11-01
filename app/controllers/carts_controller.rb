class CartsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    redirect_to items_path
  end

  def show
    @items = @cart.retreive_items
  end

  def destroy
    @item = Item.find(params[:item_id])
    @cart.remove_item(params[:item_id])
    flash[:success] = "Successfully removed <a href=#{item_path(@item)}>#{@item.title}</a> from your cart."
    redirect_to cart_path
  end
end