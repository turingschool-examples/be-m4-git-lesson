class Admin::OrdersController < Admin::BaseController
  before_action :require_admin

  def cancelled_orders

  end

  def paid_orders

  end

  def completed_orders

  end

  def cancelled_orders

  end
end

# def index
#   @orders = Order.ordered if params["status"] == "0"
#   @orders = Order.paid if params["status"] == "1"
#   @orders = Order.cancelled if params["status"] == "2"
#   @orders = Order.completed if params["status"] == "3"
# end