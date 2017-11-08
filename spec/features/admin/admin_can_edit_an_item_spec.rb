require 'rails_helper'

feature "Admin edits an existing item" do
  let!(:admin)    { create(:user, role: 1) }
  let!(:category) {create(:category)}
  let!(:category2) {create(:category)}
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

      fill_in "item[title]", with: "Night Shade Flower"

      click_button "Update Item"

      expect(page).to have_content("Night Shade Flower has been updated!")
      item.reload
      expect(item.title).to eq("Night Shade Flower")
  end

  scenario "admin can update description" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit edit_admin_item_path(item)

      fill_in "item[description]", with: "It's poisonous!"

      click_on "Update Item"

      expect(page).to have_content("#{item.title} has been updated!")
      item.reload
      expect(item.description).to eq("It's poisonous!")
  end

  scenario "admin can update price" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit edit_admin_item_path(item)

      fill_in "item[price]", with: "19.95"

      click_on "Update Item"

      expect(page).to have_content("#{item.title} has been updated!")
      item.reload
      expect(item.price).to eq(19.95)
  end

  scenario "admin can update actvitity" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit edit_admin_item_path(item)

      select "Retired", from: "item[status]"

      click_on "Update Item"

      expect(page).to have_content("#{item.title} has been updated!")
      item.reload
      expect(item.status).to eq("retired")
  end

  scenario "admin can update actvitity" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit edit_admin_item_path(item)

      select category2.title, from: "item[category_id]"

      click_on "Update Item"

      expect(page).to have_content("#{item.title} has been updated!")
      item.reload
      expect(item.category_id).to eq(category2.id)
  end

  scenario "admin can update actvitity" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit edit_admin_item_path(item)

      attach_file("item[image]", File.join(Rails.root, '/app/assets/images/logo.png'))

      click_on "Update Item"

      expect(page).to have_content("#{item.title} has been updated!")
      item.reload
      expect(item.image_content_type).to eq("image/png")
  end
end
