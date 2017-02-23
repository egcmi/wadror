class RenameOldStyle < ActiveRecord::Migration[5.0]
  def change
  	change_table :beers do |t|
  		t.rename :style, :old_style
  	end
  	add_column :beers, :style_id, :integer
  end
end
