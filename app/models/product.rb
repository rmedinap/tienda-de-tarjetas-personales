# coding: utf-8
class Product < ActiveRecord::Base
  mount_uploader :image, ProductImageUploader
end