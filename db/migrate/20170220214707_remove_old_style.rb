class RemoveOldStyle < ActiveRecord::Migration[5.0]
  def change
  	change_table :beers do |t|
  		t.remove :old_style
  	end
  end
end
