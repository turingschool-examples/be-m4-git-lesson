require 'rails_helper'

RSpec.feature "Visitor adds Item to cart" do
  let!(:category1) { create(:category) }
  let!(:item1) { create(:item, category: category1) }

  scenario "visitor adds a single item to their cart" do
    visit items_path

    click_on "Add to Cart"

    click_link "Cart"

    expect(current_path).to eq('/cart')
    expect(page).to have_content(item1.title)
    expect(page).to have_content(item1.price)
    expect(page).to have_content('Total Price:')
  end

  scenario "visitor adds multiple items to their cart" do
    item  = create(:item, category: category1)
    item2 = create(:item, category: category1)
    item3 = create(:item, category: category1)

    visit items_path

    within(".items-0") do
      click_on 'Add to Cart'
    end

    within(".items-1") do
      click_on 'Add to Cart'
    end

    within(".items-2") do
      click_on 'Add to Cart'
    end

    within(".items-3") do
      click_on 'Add to Cart'
    end

    click_link "Cart"

    expect(current_path).to eq('/cart')
    expect(page).to have_content(item.title)
    expect(page).to have_content(item.price)
    expect(page).to have_content(item1.title)
    expect(page).to have_content(item1.price)
    expect(page).to have_content(item2.title)
    expect(page).to have_content(item2.price)
    expect(page).to have_content(item3.title)
    expect(page).to have_content(item3.price)
    expect(page).to have_content('Total Price:')
  end
end