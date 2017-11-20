require 'rails_helper'

RSpec.describe 'user can visit order show page' do

  scenario 'and see one item from order' do
    category = create(:category)
    item = category.items.create(title: "Night Shade",
                                 description: "Filled with poison, but blessed with beauty and grace.",
                                 price: 19.95,
                                 image_file_name: "1.jpg",
                                 image_content_type: "image/jpeg",
                                 image_file_size: 346843)
    user = create(:user)
    order = user.orders.create(status: 0)
    order_item =  OrderItem.create(order: order, item: item)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit order_path(order)

    expect(page).to have_content("Ordered")
    expect(page).to have_content(item.title)
    expect(page).to have_link(item.title)
    expect(page).to have_content("1")
    expect(page).to have_content("$19.95")
    expect(page).to have_content("$19.95")
  end

  scenario 'and see all items from order' do
    category = create(:category)
    item1 = category.items.create(title: "Night Shade",
                                 description: "Filled with poison, but blessed with beauty and grace.",
                                 price: 10.00,
                                 image_file_name: "1.jpg",
                                 image_content_type: "image/jpeg",
                                 image_file_size: 346843)
    item2 = category.items.create(title: "Hemlock",
                                description: "Leafy Greens",
                                price: 5.00,
                                image_file_name: "1.jpg",
                                image_content_type: "image/jpeg",
                                image_file_size: 346843)
    user = create(:user)
    order = user.orders.create(status: 0)
    order_item =  OrderItem.create(order: order, item: item1)
    order_item =  OrderItem.create(order: order, item: item2)
    order_item =  OrderItem.create(order: order, item: item2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit order_path(order)

    expect(page).to have_content("Ordered")
    expect(page).to have_content(item1.title)
    expect(page).to have_link(item1.title)
    expect(page).to have_content("1")
    expect(page).to have_content("$10.00")
    expect(page).to have_content("Ordered")
    expect(page).to have_content(item2.title)
    expect(page).to have_link(item2.title)
    expect(page).to have_content("2")
    expect(page).to have_content("$10.00")
    expect(page).to have_content("$20.00")
  end
end
