# coding: utf-8
class ProductUser < ActiveRecord::Base
  validates_presence_of :product_id

  belongs_to :product
end
