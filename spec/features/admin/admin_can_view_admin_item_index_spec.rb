require 'rails_helper'

feature "Admin can navigate to '/admin/items'" do
  let!(:admin) { create(:user, role: 1) }
  scenario "by clicking link on Admin Dashboard" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    click_on "Items"

    expect(current_path).to eq(admin_items_path)
  end
end

feature "Admin can view admin items index" do
  let!(:admin)    { create(:user, role: 1) }
  let!(:category) {create(:category)}
  let!(:item)     { create(:item, category: category)}
  let!(:item1)    { create(:item, category: category)}
  scenario "with item details" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_items_path

    expect(page).to have_link(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.status)
    expect(page).to have_button("Edit")

    expect(page).to have_link(item1.title)
    expect(page).to have_content(item1.description)
    expect(page).to have_content(item1.status)
  end
end
