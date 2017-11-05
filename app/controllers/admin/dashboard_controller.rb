class Admin::DashboardController < Admin::BaseController
  before_action :require_admin
  helper_method :cancel?

  def show
    @orders = Order.order(:id)
  end

  def cancel?(order)
    (order.ordered? || order.paid?) && !order.cancelled?
  end
end