class AddPaperTypeToProductUsers < ActiveRecord::Migration
  def change
    add_column :product_users, :paper_type, :string
  end
end
