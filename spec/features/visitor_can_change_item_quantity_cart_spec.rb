require 'rails_helper'

RSpec.describe 'Visitor can change item quantity of cart' do  
  let!(:category1) { create(:category) }    
  let!(:item1) { create(:item, category: category1)}
  
  scenario 'visitor can increase item quantity' do
    # item1 = Item.create()
    # cart = Cart.new({'1' => 1})
    # allow_any_instance_of(ApplicationController).to receive(:set_cart).and_return(cart)
    # # Cart.any_instance.stub(:cart => {"1"=> 3})
    # visit cart_path

    # expect(current_path).to eq '/cart'
    # # expect(page).to have_content("3")
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

    expect(page).not_to have_content(item1.title)
  end
end