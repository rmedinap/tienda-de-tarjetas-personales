# coding: utf-8
class Contact < ActiveRecord::Base
  validates_presence_of :name, :email, :document_number, :phone, :contact_type,
                        :description, :user_id

  belongs_to :user

  mount_uploader :own_design, ProductImageUploader

  CONTACT_TYPE = [["Sugerencia", 1], ["Reclamo", 2]]
end
