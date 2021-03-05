class Product < ApplicationRecord

    #associations

    #validations
    validates :name,  presence: true, uniqueness: true
    validates :availability, presence: true
    validates :category, presence: true, inclusion: {in: %w(clothing accessories electronics groceries)}
    validates :price, presence: true
    scope :top_two_products_ordered_by_name_where_price_greater_than_50, ->(num) {where("price > ?", 50).order(:name).limit(num)}
    #custom methods
    def title_for_index
        self.name + " - " + self.category + " - " + self.price.to_s
    end

    # def self.top_two_products_ordered_by_name_where_price_greater_than_50
    #     where("price > ?", 50).order(:name).limit(2)
    # end
end
