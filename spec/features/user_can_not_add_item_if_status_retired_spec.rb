require 'rails_helper'

RSpec.describe "User can't add item to cart" do
  let!(:category1) { create(:category) }
  let!(:item1) { create(:item, category: category1) }
  let!(:item2) { create(:item, status: 1, category: category1) }

  scenario "if item status is retired, OBVIOUSLY" do
    visit item_path(item1)

    expect(page).to have_button("Add to Cart")
    expect(page).to have_content(item1.title)
    expect(page).to have_content(item1.description)
    expect(page).to have_content(item1.price)
    expect(page).to have_link("Cart (0)")

    click_on "Add to Cart"

    expect(current_path).to eq(items_path)
    expect(page).to have_link("Cart (1)")

    visit item_path(item2)

    expect(page).not_to have_button("Add to Cart")
    expect(page).to have_button("Item Retired", disabled: true)
    expect(page).to have_link("Cart (1)")
    expect(page).to have_content(item2.title)
    expect(page).to have_content(item2.description)
    expect(page).to have_content(item2.price)
  end
end