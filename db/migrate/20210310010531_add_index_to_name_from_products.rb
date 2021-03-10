class AddIndexToNameFromProducts < ActiveRecord::Migration[6.1]
  def change
    add_index :products, :name, unique: true
  end
end
