# coding: utf-8
class Category < ActiveRecord::Base
  has_many :products

  validates_presence_of :name
  validates_uniqueness_of :name

  def to_s
    name
  end
end
