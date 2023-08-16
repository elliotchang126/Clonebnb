class Addnullconstrainttocategory < ActiveRecord::Migration[7.0]
  def change
    change_column_null :listings, :category, false
  end
end
