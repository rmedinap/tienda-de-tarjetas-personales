class CreateProductModels < ActiveRecord::Migration
  def change
    create_table :product_models do |t|
      t.string :name
      t.boolean :active

      t.timestamps
    end
  end
end
