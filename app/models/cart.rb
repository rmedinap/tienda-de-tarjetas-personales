# coding: utf-8
class Cart
  attr_accessor :items

  def initialize
    @items = []
  end

  def self.load_items_from_string raw_string
    cart = self.new
    if raw_string.present?
      items = raw_string.split(',')
      cart.items = items.map do |i|
        cart.parse_item i
      end.compact
    end
    cart
  end

  def as_raw_string
    @items.map do |item|
      [item.product_id, item.product_user_id, item.quantity].compact.join('-')
    end.join(',')
  end

  def parse_item raw_string
    product_id, product_user_id, quantity = raw_string.split('-')
    if Product.exists?(product_id.to_i) && ProductUser.exists?(product_user_id.to_i)
      return CartItem.new product_id.to_i, product_user_id.to_i, quantity.to_i
    end
    nil
  end

  def add_to_cart(raw_string)
    item = parse_item raw_string
    existent_item = @items.find{|i| (i.product_id == item.product_id) && (i.product_user_id == item.product_user_id)}

    if existent_item.present?
      existent_item.increment_quantity
    else
      @items << item
    end
  end

  def total_price
    @items.sum{|item| item.total_price}
  end
end
