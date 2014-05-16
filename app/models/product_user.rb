# coding: utf-8
class ProductUser < ActiveRecord::Base
  validates_presence_of :product_id, :user_name, :job_title

  belongs_to :product

  before_save :upload_background

  mount_uploader :image, ProductUserImageUploader

  def self.svg_to_png(svg)
    img = Magick::Image::from_blob(svg)
    return img[0].to_blob {self.format = 'PNG'}
  end

  def replace_background
    image_svg
  end

  def upload_background
    # product_image = request.protocol + request.host_with_port + self.product.image.url
    # product_image = "localhost:3000" + self.product.image.url
    # product_image = self.product.image.path
    # Rails.logger.info product_image
    # product_image = "/uploads/product/image/1/product_test_123.jpeg"
    # self.image    = File.open(product_image)
    # self.image    = File.open(File.join(Rails.root, product_image))
    # self.image    = product_image
  end
end
