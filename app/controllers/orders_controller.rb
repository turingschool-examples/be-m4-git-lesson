class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
  order = Order.new(user: current_user)
    if order.save
      items = Item.find(params[:cart].keys.map { |key| key.to_i })
      items.each { |item| order.items << item }
      flash[:success] = "Order was successfully placed"
      redirect_to orders_path
    else
      flash[:error] = "An error occured please re-place your order."
      redirect_to cart_path
    end
  end
end
