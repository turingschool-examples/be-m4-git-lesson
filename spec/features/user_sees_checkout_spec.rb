require 'rails_helper'

RSpec.feature "Visitor visits '/cart'" do
  let!(:category1) { create(:category) }
  let!(:item1) { create(:item, category: category1) }

  scenario "visitor must login or register to checkout" do
    visit items_path

    click_on "Add to Cart"
    click_link "Cart"

    expect(page).to have_link("You must login or register to checkout")
  end

  scenario "registered user sees checkout button" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit items_path

    click_on "Add to Cart"
    click_link "Cart"

    expect(page).to have_button("Checkout")
  end

  scenario "registered user sees orders placed" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit items_path

    click_on "Add to Cart"
    click_link "Cart"
    click_on "Checkout"
    save_and_open_page

    expect(current_path).to eq orders_path
    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_content(Order.last.id)
  end
end

# When I am logged in And I visit my cart
# And when I click “Checkout”
# Then the order should be placed
# And my current page should be “/orders”
# And I should see a message “Order was successfully placed”
# And I should see the order I just placed in a table
