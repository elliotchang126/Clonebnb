class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :type, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, null: false
      t.string :zip_code, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.integer :bedrooms, null: false
      t.integer :bathrooms, null: false
      t.integer :price, null: false
      t.integer :cleaning_fee, null: false
      t.float :longitude, null: false
      t.float :latitude, null: false

      t.timestamps
    end
      add_index :listings, [:address, :city, :zip_code], unique: true
  end
end
