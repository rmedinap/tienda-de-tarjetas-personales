class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :name
      t.string :email
      t.text :address
      t.string :document_number
      t.integer :payment_type
      t.string :special_id
      t.string :subtotal
      t.string :discount

      t.timestamps
    end
  end
end
