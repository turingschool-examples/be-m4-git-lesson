class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  before_save :get_price

  def get_price
    item = Item.find(item_id)
    self.price = item.price
  end

  def self.item_quantity(order_id, item_id)
    where("order_id = ? AND item_id = ?", order_id, item_id).count
  end

  def self.item_subtotal(order_id, item_id)
    count = item_quantity(order_id, item_id)
    price = OrderItem.find_by(item_id: item_id).price
    count * price
  end

  def self.total(order_id)
    where(order_id: order_id).pluck(:price).sum
  end
end
