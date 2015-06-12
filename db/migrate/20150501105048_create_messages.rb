class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :detail

      t.references :post_sell, index: true
      t.references :user_account, index: true
      t.timestamps null: false
    end

    
  end
end
