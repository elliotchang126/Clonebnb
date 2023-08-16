class Updatelistings < ActiveRecord::Migration[7.0]
  def change
    remove_column :listings, :type
    add_column :listings, :category, :string
  end
end
