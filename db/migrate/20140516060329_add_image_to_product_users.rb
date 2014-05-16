class AddImageToProductUsers < ActiveRecord::Migration
  def change
    add_column :product_users, :image, :string
    add_column :product_users, :image_svg, :text
  end
end
