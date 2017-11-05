class Admin::DashboardController < Admin::BaseController
  before_action :require_admin
  helper_method :cancellable?

  def show
    @orders = Order.order(:id)
  end

  def cancellable?(order)
    (order.ordered? || order.paid?) && !order.cancelled?
  end
end