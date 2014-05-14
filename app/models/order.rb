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

  before_create :save_total_and_discount

  def calculate_subtotal
    subtotal = line_items.inject(0){|acc, item| acc + (item.total_price)}
    subtotal
  end

  # def calculate_discount
  # end

  def save_total_and_discount
    self.subtotal = self.calculate_subtotal
    # self.discount = self.calculate_discount
  end

  def total
    total = (self.subtotal).to_f - (self.discount).to_f
    total
  end

  def add_line_items_from_cart cart
    cart.items.each do |item|
      li = LineItem.from_cart_item item
      line_items << li
    end
  end
end
