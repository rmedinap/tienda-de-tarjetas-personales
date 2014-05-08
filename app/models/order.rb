# coding: utf-8
class Order < ActiveRecord::Base
  attr_accessor :terms_of_service

  PAYMENT_TYPES =[["Depósito", 1], ["Pago Contra entrega", 2]]
end
