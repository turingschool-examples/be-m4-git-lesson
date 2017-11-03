class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    p params
  end
end
