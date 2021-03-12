class AddBrandIdToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :brand, foreign_key: {on_delete: :cascade}
  end
end
