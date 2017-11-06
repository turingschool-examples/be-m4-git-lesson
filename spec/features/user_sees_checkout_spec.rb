require 'rails_helper'

RSpec.feature "Visitor visits '/cart'" do
  let!(:category1) { create(:category) }
  let!(:item1) { create(:item, category: category1) }


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

    expect(current_path).to eq orders_path
    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_content(Order.last.id)
    expect(page).to have_content("Cart (0)")
  end
end
