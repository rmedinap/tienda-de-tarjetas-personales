# coding: utf-8
class CartItem
  attr_accessor :product_id, :product_user_id, :quantity

  def initialize product_id, product_user_id, quantity
    @product_id = product_id
    @product_user_id = product_user_id
    @quantity = quantity
  end

  def product
    @product ||= Product.find(product_id)
  end

  def product_user
    @product_user ||= ProductUser.find product_user_id
  end

  def increment_quantity
    @quantity += 1
  end

  def name
    @product_user.product.name
  end

  def price
    @product.price
  end

  def total_price
    @product.price * @quantity
  end
end
