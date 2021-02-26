class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.float :price
      t.string :sku_number
      t.boolean :availability

      t.timestamps
    end
  end
end
