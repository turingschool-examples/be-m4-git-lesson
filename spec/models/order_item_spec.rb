require 'rails_helper'

describe OrderItem do
  describe "relationship" do
    it { should belong_to(:item) }
    it { should belong_to(:order) }
  end

  describe "Class Methods" do
    it ".item_quantity" do
      category = create(:category)
      item = create(:item, category: category)
      user = create(:user)
      order = create(:order, user: user)
      OrderItem.create(order: order, item: item)
      OrderItem.create(order: order, item: item)

      expect(OrderItem.item_quantity(order.id, item.id)).to eq(2)
    end

    it ".item_subtotal" do
      category = create(:category)
      item = create(:item, category: category, price: 4.00)
      user = create(:user)
      order = create(:order, user: user)
      OrderItem.create(order: order, item: item)
      OrderItem.create(order: order, item: item)

      expect(OrderItem.item_subtotal(order.id, item.id)).to eq(8.0)
    end

    it ".item_total" do
      category = create(:category)
      item1 = create(:item, category: category, price: 4.00)
      item2 = create(:item, category: category, price: 2.00)
      user = create(:user)
      order = create(:order, user: user)
      OrderItem.create(order: order, item: item1)
      OrderItem.create(order: order, item: item1)
      OrderItem.create(order: order, item: item2)

      expect(OrderItem.total(order.id)).to eq(10.0)
    end
  end

  describe "Instance Methods" do
    it "#get_price" do
      category = create(:category)
      item = create(:item, category: category, price: 4.00)
      user = create(:user)
      order = create(:order, user: user)
      order_item = OrderItem.create(order: order, item: item)

      expect(order_item.get_price).to eq(4.0)
    end
  end
end
