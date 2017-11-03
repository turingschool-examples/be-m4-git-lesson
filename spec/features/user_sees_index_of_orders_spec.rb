require 'rails_helper'

RSpec.describe "User sees an index of orders" do
  xscenario "when user visits '/orders'" do
    user = User.create(first_name: "John",
                       last_name: "Doe",
                       email: "John@Doe.com",
                       password: "test",
                       address: "123 House Lane Denver, CO 80231")

    order = Order.create(status: 0, user: user)
    order2 = Order.create(status: 0, user: user)

    visit orders_path

    expect(page).to have_content(order.id)
    expect(page).to have_content(order2.id)
  end
end
