class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_item(id)
    contents[id.to_s] = (contents[id.to_s] || 0) + 1
  end

  def cart_total_price
    contents.map { |key, value| Item.find(key).price * value }.sum
  end

  def retrieve_items
    contents.keys.map { |key| Item.find(key) }
  end

  def decrease_quantity(id)
    quantity = (contents[id.to_s] = contents[id.to_s] - 1)
    remove_item(id) if quantity == 0
  end

  def count_of(id)
    contents[id.to_s]
  end

  def total
    contents.values.sum
  end

  def remove_item(id)
    contents.delete(id.to_s)
  end

  def item_subtotal(id)
    Item.find(id).price * count_of(id)
  end
end
