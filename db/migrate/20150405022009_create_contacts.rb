class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :name
      t.integer :phone_number
      t.text :description
      t.boolean :delete_flag
      t.timestamps null: false
    end
  end
end
