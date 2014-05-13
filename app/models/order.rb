# coding: utf-8
class Order < ActiveRecord::Base
  attr_accessor :terms_of_service

  validates_presence_of :user_id, :name, :email, :document_number, :address,
                        :payment_type
  validates :terms_of_service, acceptance: true
  validates :document_number, :numericality => true, :length => {maximum: 10}

  belongs_to :user
  has_many :line_items, dependent: :destroy

  PAYMENT_TYPES =[["Depósito", 1], ["Pago Contra entrega", 2]]

  # after_create :save_total_and_discount
  before_create :save_total_and_discount

  def calculate_subtotal
    subtotal = line_items.inject(0){|acc, item| acc + (item.total_price)}
    subtotal
  end

  def save_total_and_discount
    self.subtotal = self.calculate_subtotal
    # self.discount =
  end

  def add_line_items_from_cart cart
    cart.items.each do |item|
      li = LineItem.from_cart_item item
      line_items << li
      # @order.line_items.build(
        # product_id: item.product_id,
        # product_user_id: item.product_user_id,
        # name: item.product.try(:name),
        # total_price: item.total_price,
        # quantity: item.quantity
      # )
    end
  end
end
