class AddOwnDesignToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :own_design, :string
  end
end
