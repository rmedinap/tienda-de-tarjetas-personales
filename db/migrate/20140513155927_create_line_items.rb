class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :order_id
      t.decimal :total_price
      t.integer :product_id
      t.integer :product_user_id
      t.integer :quantity
      t.string :name

      t.timestamps
    end
  end
end
