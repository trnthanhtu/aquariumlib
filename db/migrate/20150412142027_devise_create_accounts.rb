class DeviseCreateAccounts < ActiveRecord::Migration
  def change
    create_table(:accounts) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.boolean :delete_flag
      t.boolean :admin
      t.string  :name
      t.string  :image
      t.string  :detail
      t.string  :address
      t.timestamps

    end

    add_index :accounts, :email,                unique: true
    # add_index :accounts, :confirmation_token,   unique: true
    # add_index :accounts, :unlock_token,         unique: true
  end
end
