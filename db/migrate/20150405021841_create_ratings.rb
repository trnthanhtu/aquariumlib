class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :point
      t.boolean :delete_flag
      t.timestamps null: false
      t.references :post, index: true
      t.references :account, index: true
    end
  end
end
