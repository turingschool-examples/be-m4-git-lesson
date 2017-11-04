class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  before_save :get_price

  def get_price
    item = Item.find(item_id)
    self.price = item.price
  end
end
