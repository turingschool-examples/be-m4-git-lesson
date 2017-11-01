require 'rails_helper'

RSpec.describe 'Visitor can change item quantity of cart' do
  let!(:category1) { create(:category) }
  let!(:item1) { create(:item, category: category1)}

  scenario 'visitor can increase item quantity' do

  end

  scenario 'visitor can decrease item quantity' do

  end

  scenario 'visitor can remove an item from cart' do

    visit item_path(item1)

    expect(current_path).to eq("/items/#{item1.id}")

    click_button "Add to Cart"
    click_button "Add to Cart"

    visit cart_path(item_id: item1.id)
    expect(page).to have_content(item1.title)

    click_button "Remove"
    save_and_open_page
    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Successfully removed")
    expect(page).not_to have_content(item1.description)
  end
end