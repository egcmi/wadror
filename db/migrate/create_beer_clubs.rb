class CreateBeerClubs < ActiveRecord::Migration[5.0]
  def change
    create_table :beer_clubs do |t|
      t.string, :name
      t.int, :founded
      t.string :city

      t.timestamps
    end
  end
end
