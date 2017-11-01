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

    it '#decrease_quantity' do
      subject.add_item(1)
      subject.add_item(2)

      expect(subject.contents).to eq({'1' => 1, "2" => 1})

      subject.decrease_quantity(2)

      expect(subject.contents).to eq({'1' => 1})

      subject.add_item(2)
      subject.add_item(2)

      expect(subject.contents).to eq({'1' => 1, "2" => 2})

      subject.decrease_quantity(2)

      expect(subject.contents).to eq({'1' => 1, "2" => 1})
    end

    it '#retrieve_items' do
      category = create(:category)
      item  = create(:item, price: 2, category: category)
      item2 = create(:item, price: 10, category: category)
      subject.add_item(item.id)
      subject.add_item(item2.id)

      expect(subject.retrieve_items.count).to eq(2)
    end

    it '#count_of' do
      subject.add_item(1)
      subject.add_item(2)
      subject.add_item(2)

      expect(subject.count_of(1)).to eq(1)
      expect(subject.count_of(2)).to eq(2)
    end

    it '#remove_item' do
      subject.add_item(1)
      subject.add_item(1)
      subject.add_item(1)
      subject.add_item(1)
      subject.add_item(2)

      expect(subject.contents).to eq({'1' => 4, "2" => 1})

      subject.remove_item(1)

      expect(subject.contents).to eq({"2" => 1})
    end

    it '#item_subtotal' do
      category = create(:category)
      item  = create(:item, price: 2, category: category)
      subject.add_item(item.id)
      subject.add_item(item.id)

      expect(subject.item_subtotal(item.id)).to eq(4)
    end
  end
end