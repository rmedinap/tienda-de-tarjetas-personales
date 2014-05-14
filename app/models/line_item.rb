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

  def self.calculate_present_popular_products quantity = 10
    # Only existing products list
    lines = select(:id, :product_id).includes(:product)
            .select{|li| li.product != nil}.map{|li| li.id}
    popular_products = where("id IN (?)", lines).group(:product).count.first(quantity)
    popular_products
  end

  def self.calculate_popular_products quantity = 10
    deleted_popular_products = group(:product_id, :name).count
    deleted_popular_products
  end

end
