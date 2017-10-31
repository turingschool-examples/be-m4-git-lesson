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

  def retreive_items
    contents.keys.map { |key| Item.find(key) }
  end
end
