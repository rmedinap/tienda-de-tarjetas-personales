class AddProductModelIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_model_id, :integer
  end
end
