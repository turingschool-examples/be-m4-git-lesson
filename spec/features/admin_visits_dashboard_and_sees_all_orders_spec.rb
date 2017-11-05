require 'rails_helper'

RSpec.feature "Admin visits dashboard" do
  let!(:admin) { create(:user, role: 1) }

  scenario "admin sees listing for all orders" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    


    # sees listing of all orders 
    # sees total number of orders for each status
    #sees link for each individual order and filter orders by status type
    # have links to transition between status type (ordered paid etc)
    # can click on cancel on orders that are paid or ordered
    # can click on mark as paid on orders that are ordered
    # can click on mark as completed on orders that are paid
  end
end