class CreateBeerClubs < ActiveRecord::Migration[5.0]
  def change
    create_table :beer_clubs do |t|
      t.string :name
      t.integer :founded
      t.string :city

      t.timestamps null: false
    end
  end
end
