require 'rails_helper'

RSpec.feature 'Visitor can adjust cart total' do
  let!(:category1) { create(:category) }
  let!(:item1) { create(:item, category: category1)}

  scenario 'visitor sees cart total' do
    visit cart_path

    expect(page).to have_content("Your cart is empty.")
  end

  scenario 'visitor adds item, total changes' do
    visit item_path(item1)
    click_button "Add to Cart"
    click_button "Add to Cart"
    total = item1.price * 2

    click_link "Cart"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("2")
    expect(page).to have_content("Total Price: $#{total}")
  end

  scenario 'visitor can increase item, total changes' do
    visit item_path(item1)
    click_button "Add to Cart"
    click_link "Cart"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Total Price: $#{item1.price}")
    total = item1.price * 2

    click_on "+"

    expect(page).to have_content("Total Price: $#{total}")
  end
end