class Admin::OrdersController < Admin::BaseController
  def index
    @orders = delegate_orders
  end

  def delegate_orders
    return Order.ordered   if params[:status] == "0"
    return Order.paid      if params[:status] == "1"
    return Order.cancelled if params[:status] == "2"
    return Order.completed if params[:status] == "3"
  end
end