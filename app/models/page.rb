# encoding: utf-8
class Page < ActiveRecord::Base
  validates_presence_of :title, :content

  scope :actives, -> { where(:active => true) }

  def to_s
    title
  end

  def to_param
    "#{id}-#{title.gsub(" ", "-")}"
  end
end
