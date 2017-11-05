FactoryBot.define do
  factory :order_item do
    item
    order
    sequence :price do
      Faker::Commerce.price
    end
  end

  factory :order do
    user
    status 0
  end
end