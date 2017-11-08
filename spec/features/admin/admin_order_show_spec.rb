require 'rails_helper'

feature "Admin sees order show" do
  scenario "with user details of order" do
    category = create(:category)
    item = create(:item, category: category)
    admin = create(:user, role: 1)
    user = create(:user)
    order = create(:order, user: user)
    order_item =  OrderItem.create(order: order, item: item)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit order_path(order)

    expect(page).to have_content(item.title)
    expect(page).to have_link(item.title)
    expect(page).to have_content("1")
    expect(page).to have_content(order_item.price)
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.address)
  end
end

feature "Default user cannot" do
  scenario "see user details with order" do
    category = create(:category)
    item = create(:item, category: category)
    user = create(:user)
    order = create(:order, user: user)
    order_item =  OrderItem.create(order: order, item: item)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit order_path(order)

    expect(page).to have_content(item.title)
    expect(page).to have_link(item.title)
    expect(page).to have_content("1")
    expect(page).to have_content(order_item.price)
    expect(page).not_to have_content(user.last_name)
    expect(page).not_to have_content(user.address)
  end
end
