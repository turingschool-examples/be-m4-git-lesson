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

end



# As a visitor When I add items to my cart
# And I visit “/cart” And I click “Login or Register to Checkout”
# Then I should be required to login

# When I am logged in And I visit my cart
# And when I click “Checkout”
# Then the order should be placed
# And my current page should be “/orders”
# And I should see a message “Order was successfully placed”
# And I should see the order I just placed in a table
