class CreateProductUsers < ActiveRecord::Migration
  def change
    create_table :product_users do |t|
      t.integer :product_id
      t.string :company_name
      t.string :company_message
      t.string :user_name
      t.string :job_title
      t.string :address
      t.string :phone
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
