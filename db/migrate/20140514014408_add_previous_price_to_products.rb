class AddPreviousPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :previous_price, :decimal
  end
end
