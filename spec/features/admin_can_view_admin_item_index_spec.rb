require 'rails_helper'

feature "Admin can navigate to '/admin/items'" do
  let!(:admin) { create(:user, role: 1) }
  scenario "by clicking link on Admin Dashboard" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    expect(page).to have_link("View All Items")

    click_on "View All Items"

    expect(current_path).to eq(admin_items_path)
  end
end


#Then I should see a table with all items (active and inactive)

#And each item should have:
# A thumbnail of the image
# Title that links to the item
# Description
# Status
# Actions (Edit)
