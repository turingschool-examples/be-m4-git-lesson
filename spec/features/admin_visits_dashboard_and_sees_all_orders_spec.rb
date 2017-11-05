require 'rails_helper'

RSpec.feature "Admin visits dashboard" do
  let!(:admin)  { create(:user, role: 1)    }
  let!(:order1) { create(:order, status: 0) }
  let!(:order2) { create(:order, status: 1) }
  let!(:order3) { create(:order, status: 2) }
  let!(:order4) { create(:order, status: 3) }

  scenario "admin sees listing for all orders" do
    login_as(admin)

    visit admin_dashboard_path

    expect(page).to have_content("User Profile")
    expect(page).to have_content("View Past Orders")
    expect(page).to have_content("Edit Account")
    expect(page).to have_content("All Orders")

    expect(page).to have_content(order1.user.first_name)
    expect(page).to have_content(order2.user.first_name)
    expect(page).to have_content(order3.user.first_name)
    expect(page).to have_content(order4.user.first_name)
    expect(page).to have_content(order1.status)
    expect(page).to have_content(order2.status)
    expect(page).to have_content(order3.status)
    expect(page).to have_content(order4.status)

    expect(page).to have_link("#{order1.id}", href: "/orders/#{order1.id}")
    expect(page).to have_link("#{order2.id}", href: "/orders/#{order2.id}")
    expect(page).to have_link("#{order3.id}", href: "/orders/#{order3.id}")
    expect(page).to have_link("#{order4.id}", href: "/orders/#{order4.id}")

    expect(page).to have_content("Orders By Status")

    expect(page).to have_content("Paid (1)")
    expect(page).to have_content("Ordered (1)")
    expect(page).to have_content("Cancelled (1)")
    expect(page).to have_content("Completed (1)")
  end
end