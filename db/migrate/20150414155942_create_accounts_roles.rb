class CreateAccountsRoles < ActiveRecord::Migration
  def change
    create_table :accounts_roles do |t|
      t.references :role, :account
      t.timestamps null: false
      t.boolean :delete_flag
    end
  end
end
