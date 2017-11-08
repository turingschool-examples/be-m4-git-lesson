require 'rails_helper'

RSpec.describe Order do
  describe "validations" do
    it{ should validate_presence_of(:status) }
    it { should define_enum_for(:status) }
  end

  describe 'relationships' do
    it { should belong_to(:user) }
    it { should respond_to(:user) }
    it { should have_many(:items) }
    it { should respond_to(:items) }
  end

  describe "class methods" do
    it ".total_ordered" do
      user = create(:user)
      create(:order, status:0, user: user)
      create(:order, status:0, user: user)

      expect(Order.total_ordered).to eq(2)
    end

    it ".total_paid" do
      user = create(:user)
      create(:order, status:1, user: user)
      create(:order, status:1, user: user)

      expect(Order.total_paid).to eq(2)
    end

    it ".total_cancelled" do
      user = create(:user)
      create(:order, status:2, user: user)
      create(:order, status:2, user: user)

      expect(Order.total_cancelled).to eq(2)
    end

    it ".total_completed" do
      user = create(:user)
      create(:order, status:3, user: user)
      create(:order, status:3, user: user)

      expect(Order.total_completed).to eq(2)
    end
  end

  describe "instance methods" do
    it "#formate_date" do
      user  = create(:user)
      order = create(:order, user: user)
      comparison = order.format_date(order.created_at).split("/")

      expect(comparison[0].to_i).to be_between(0, 13).exclusive
      expect(comparison[1].to_i).to be_between(0, 32).exclusive
      expect(comparison[2].length).to eq(16)
      expect(comparison[2].to_i).to be_kind_of(Integer)
    end

    it "#create_order_items" do
      user  = create(:user)
      order = create(:order, user: user)
      category = create(:category)
      item = create(:item, category: category)
      item = create(:item, category: category)
      cart = {"1" => 2}
      order.create_order_items(cart)

      expect(order.items.count).to eq(2)
    end
  end
end
