class CreateTechnicals < ActiveRecord::Migration
  def change
    create_table :technicals do |t|
      t.integer :temperature
      t.integer :light
      t.integer :pH
      t.text    :fertilizer
      t.string  :trophic
      t.text    :notice
      t.integer :level
      t.string  :size
      t.string  :address_grow
      t.boolean :delete_flag
      t.timestamps null: false
      t.references :plant, index: true
    end
  end
end
