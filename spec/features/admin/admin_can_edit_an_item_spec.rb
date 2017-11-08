require 'rails_helper'

feature "Admin edits an existing item" do
  scenario "admin can visit edit item" do
    let!(:admin)    { create(:user, role: 1) }
    let!(:category) {create(:category)}
    let!(:item)     { create(:item, category: category)}
    let!(:item1)    { create(:item, category: category)}
    scenario "with item details" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end
end

# As an admin When I visit “admin/items”
# And I click “Edit”
# Then my current path should be “/admin/items/:ITEM_ID/edit”
# And I should be able to update title, description, image, and status
