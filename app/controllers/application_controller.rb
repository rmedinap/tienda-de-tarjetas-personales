class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_cart

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def load_cart
    @cart = Cart.load_items_from_string cookies[:cart_items]
  end

  def save_cart
    cookies[:cart_items] = @cart.as_raw_string
  end

end
