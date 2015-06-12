class ChangReferentce1 < ActiveRecord::Migration
  def change
  	  add_reference :plants, :technical, index: true
  end
end
