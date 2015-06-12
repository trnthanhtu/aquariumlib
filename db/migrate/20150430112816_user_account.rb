class UserAccount < ActiveRecord::Migration
  def change
  	create_table(:user_accounts) do |t|
      ## Database authenticatable
      t.string  :usename,  null: false, default: ""
      t.string  :password, null: false, default: ""
      t.string  :name
      t.string  :image
      t.string  :detail
      t.string  :sex
      t.string  :address
      
      t.timestamps

    end

    add_index :user_accounts, :usename,                unique: true
  end


end
