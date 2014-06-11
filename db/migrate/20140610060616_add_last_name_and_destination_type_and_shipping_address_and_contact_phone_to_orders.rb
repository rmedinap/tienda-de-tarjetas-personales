class AddLastNameAndDestinationTypeAndShippingAddressAndContactPhoneToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :last_name, :string
    add_column :orders, :destination_type, :string
    add_column :orders, :shipping_address, :string
    add_column :orders, :contact_phone, :string
    add_column :orders, :sent_to_dispatch, :datetime
    add_column :orders, :state, :string
  end
end
