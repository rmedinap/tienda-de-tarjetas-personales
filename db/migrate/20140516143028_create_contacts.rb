class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :document_number
      t.string :phone
      t.string :contact_type
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
