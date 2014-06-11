# coding: utf-8
class Order < ActiveRecord::Base
  attr_accessor :terms_of_service, :proof_type

  validates_presence_of :user_id, :name, :last_name, :email, :document_number, :address,
                        :payment_type, :shipping_address, :contact_phone, :destination_type
  validates :terms_of_service, acceptance: true
  validates :document_number, numericality: true, length: { is: 8 },
    if: lambda { |order| order.proof_type == PROOF_TYPE.first }
  validates :document_number, numericality: true, length: { is: 11 },
    if: lambda { |order| order.proof_type == PROOF_TYPE.last }

  belongs_to :user
  has_many :line_items, dependent: :destroy

  PAYMENT_TYPES     = {"Depósito" => 1, "Pago Contra entrega" => 2}
  PROOF_TYPE        = ['Boleta', 'Factura']
  DESTINATION_TYPE  = ["Domicilio", "Local"]
  STATES            = ["En despacho", "Despachada"]

  scope :list_to_dispatch, -> {where.not(:sent_to_dispatch => nil).where(:state => STATES[0])}

  before_create :save_total_and_discount

  def calculate_subtotal
    subtotal = line_items.inject(0){|acc, item| acc + (item.total_price)}
    subtotal
  end

  def save_total_and_discount
    self.subtotal = self.calculate_subtotal
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
