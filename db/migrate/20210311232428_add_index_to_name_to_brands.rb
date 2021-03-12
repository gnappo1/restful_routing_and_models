class AddIndexToNameToBrands < ActiveRecord::Migration[6.1]
  def change
    add_index :brands, :name, unique: true
  end
end
