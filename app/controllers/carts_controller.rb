class CartsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "#{item.title} has been added to your cart!"
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
      flash[:notice] = "#{@item.title} has been added to your cart!"
    when params[:decrement_me]
      @item = Item.find(params[:decrement_me])
      @cart.decrease_quantity(@item.id)
      flash[:notice] = "You removed #{@item.title} from your cart!"
    end
    redirect_to cart_path
  end
end