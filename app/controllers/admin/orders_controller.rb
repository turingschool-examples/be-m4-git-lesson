class Admin::OrdersController < Admin::BaseController
  before_action :require_admin

  def index
    @orders = delegate_orders
    p params
  end

  def delegate_orders
    return Order.ordered   if params["status"] == "0"
    return Order.paid      if params["status"] == "1"
    return Order.cancelled if params["status"] == "2"
    return Order.completed if params["status"] == "3"
  end

  def cancelled_orders

  end

  def paid_orders

  end

  def completed_orders

  end

  def cancelled_orders

  end


end
