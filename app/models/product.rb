# coding: utf-8
class Product < ActiveRecord::Base
  belongs_to :category

  validates_presence_of :name, :description, :image, :price, :category_id
  validates_numericality_of :price
  validates_uniqueness_of :name

  mount_uploader :image, ProductImageUploader

  def to_s
    name
  end
end
