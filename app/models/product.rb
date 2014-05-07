# coding: utf-8
class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :product_model
  has_many :product_users

  validates_presence_of :name, :description, :image, :price, :category_id, :product_model_id
  validates_numericality_of :price
  validates_uniqueness_of :name

  mount_uploader :image, ProductImageUploader

  def to_s
    name
  end
end
