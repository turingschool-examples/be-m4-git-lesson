class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def create
    Order.new
    if Order.save
      flash[:success] = "Order was successfully placed"
      redirect_to orders_path
    else
      flash[:error] = "An error occured please replace your order."
      redirect_to cart_path
    end
  end
end
