require 'rails_helper'

RSpec.describe Cart, type: :model do
  subject { Cart.new({}) }

  describe "instance methods" do
    it "#add_item" do
      subject.add_item(1)
      subject.add_item(2)

      expect(subject.contents).to eq({'1' => 1, "2" => 1})
    end

    it "#cart_total_price" do
      category = create(:category)
      item  = create(:item, price: 2, category: category)
      item2 = create(:item, price: 10, category: category)
      subject.add_item(item.id)
      subject.add_item(item.id)
      subject.add_item(item2.id)

      expect(subject.cart_total_price).to eq(14)
    end
  end
end