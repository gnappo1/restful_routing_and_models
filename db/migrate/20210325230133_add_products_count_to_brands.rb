class AddProductsCountToBrands < ActiveRecord::Migration[6.1]
  def change
    add_column :brands, :products_count, :integer, default: 0, null: false

    # Brand.find_each {|b| Brand.reset_counters(b.id, :products)}

    reversible do |dir|
      dir.up {data}
    end
  end

  def data
    #squish: Returns the string, first removing all whitespace on both ends of the string, and then changing remaining consecutive whitespace groups into one space each.
    #count(1) is the same of count(*), meaning it counts all the rows!
    execute <<-SQL.squish
      UPDATE brands
        SET products_count = (
          SELECT count(1)
          FROM products
          WHERE products.brand_id = brands.id
        )
    SQL
  end
end
