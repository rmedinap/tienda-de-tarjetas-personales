#coding: utf-8
class ProductModel < ActiveRecord::Base
  has_many :products

  validates_presence_of :name

  scope :actives, -> { where(:active => true) }

  def to_s
    name
  end
end
