class CartItemsController < ApplicationController
  after_filter  :save_cart

  def index
  end

  def create
    product = Product.find params[:product_id]
    product_user = product.product_users.find params[:id]
    quantity = params[:quantity]
    @cart.add_to_cart "#{product.id}-#{product_user.id}-#{quantity}"
    redirect_to root_url
  end

  def destroy
    @cart.items.delete_if do |i|
      (i.product_id.to_s == params[:product_id]) && (i.product_user_id.to_s == params[:product_user_id])
    end

    redirect_to cart_items_url
  end

  def update_all
    params[:variant].each do |variant_id, fields|
      item = @cart.items.find { |i| i.variant_id.to_s == variant_id }
      item.quantity = fields['qty'].to_i
      item.variant_id = fields['variant_id'].to_i if fields['variant_id'].present?
    end

    redirect_to cart_items_url
  end

end
