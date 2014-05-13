# coding: utf-8
class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :product_user

  def self.from_cart_item cart_item
    li = self.new
    li.product      = cart_item.product
    li.product_user = cart_item.product_user
    li.name         = cart_item.product.try(:name)
    li.total_price  = cart_item.total_price
    li.quantity     = cart_item.quantity
    li
  end
end
