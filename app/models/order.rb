# coding: utf-8
class Order < ActiveRecord::Base
  attr_accessor :terms_of_service

  validates_presence_of :user_id, :name, :email, :document_number, :address,
                        :payment_type
  validates :terms_of_service, acceptance: true
  validates :document_number, :numericality => true, :length => {maximum: 10}

  belongs_to :user

  PAYMENT_TYPES =[["Depósito", 1], ["Pago Contra entrega", 2]]

end
