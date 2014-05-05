# coding: utf-8
class ProductUser < ActiveRecord::Base
  validates_presence_of :product_id, :user_name, :job_title

  belongs_to :product
end
