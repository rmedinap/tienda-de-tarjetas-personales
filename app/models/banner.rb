# coding: utf-8
class Banner < ActiveRecord::Base
  validates_presence_of :image

  mount_uploader :image, BannerImageUploader
end
