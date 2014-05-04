# coding: utf-8
class Category < ActiveRecord::Base
  has_many :products

  def to_s
    name
  end
end
