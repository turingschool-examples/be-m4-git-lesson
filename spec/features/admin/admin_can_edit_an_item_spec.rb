require 'rails_helper'

feature "Admin edits an existing item" do
  let!(:admin)    { create(:user, role: 1) }
  let!(:category) {create(:category)}
  let!(:item)     { create(:item, category: category)}
  scenario "admin can visit edit item page" do

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_items_path
      click_on "Edit"

      expect(current_path).to eq(edit_admin_item_path(item))
      expect(page).to have_content("Edit Item")
  end

  scenario "admin can update title" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit edit_admin_item_path(item)

      fill_in "item[title]",       with: "Night Shade Flower"

      click_on "Update Item"

      expect(current_path).to eq(edit_admin_item_path(item))
      expect(page).to have_content("Edit Item")
  end
end

# And I should be able to update title, description, image, and status
