class CartsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:success] = "<a href=#{item_path(item)}>#{item.title}</a> <span>has been added to your cart!</span>"
    redirect_to items_path
  end

  def show
    @items = @cart.retrieve_items
  end

  def destroy
    @item = Item.find(params[:item_id])
    @cart.remove_item(params[:item_id])
    flash[:success] = "Successfully removed <a href=#{item_path(@item)}>#{@item.title}</a> from your cart."
    redirect_to cart_path
  end

  def update
    case
    when params[:increment_me]
      @item = Item.find(params[:increment_me])
      @cart.add_item(@item.id)
      flash[:success] = "<a href=#{item_path(@item)}>#{@item.title}</a> Quantity updated: #{@cart.count_of(@item.id)}"

    when params[:decrement_me]
      @item = Item.find(params[:decrement_me])
      @cart.decrease_quantity(@item.id)
      if !@cart.count_of(@item.id)
        flash[:success] = "Successfully removed <a href=#{item_path(@item)}>#{@item.title}</a> from your cart."
      else
        flash[:success] = "<a href=#{item_path(@item)}>#{@item.title}</a> Quantity updated: #{@cart.count_of(@item.id)}"
      end
    end
    redirect_to cart_path
  end
end