class OrdersController < ApplicationController
  before_action :check_user

  def index
    @orders = current_user.orders.reverse_order
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    order = Order.new(user: current_user)
    if order.save
      order.create_order_items(session[:cart])
      session[:cart] = {}
      flash[:success] = "Order was successfully placed."
      redirect_to orders_path
    else
      flash[:error] = "An error occured please replace your order."
      redirect_to cart_path
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.ordered? || @order.paid?
      status = params[:status]
      @order.update(status: status)
      if @order.save
        flash[:success] = "Order no #{@order.id} marked as #{status}"
        redirect_to admin_dashboard_path
      end
    end
  end

  private
  def check_user
    redirect_to login_path if !current_user
  end
end
