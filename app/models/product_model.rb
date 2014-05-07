#coding: utf-8
class ProductModel < ActiveRecord::Base

  def to_s
    name
  end
end
