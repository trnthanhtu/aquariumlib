class ChangReferentce < ActiveRecord::Migration
  def change
  	remove_reference :technicals, :plant, index: true
  end
end
