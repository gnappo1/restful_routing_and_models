class Product < ApplicationRecord
    belongs_to :brand

    #validations
    validates :name,  presence: true, uniqueness: true, length: {minimum: 7}, two_words: true #new custom validation called two_words
    validates :category, presence: true, inclusion: {in: %w(clothing accessories electronics groceries)}
    validates :price, presence: true
    
    # accepts_nested_attributes_for :brand, reject_if: proc { |attributes| attributes['name'].blank? || attributes['year_founded'].blank?}
    scope :top_two_products_ordered_by_name_where_price_greater_than_50, -> {where("price > ?", 50).order(:name)}

    def brand_attributes=(attributes)
        if !attributes["name"].blank?
            self.brand = Brand.find_or_create_by(attributes)
        end
    end


    #custom methods
    def title_for_index
        self.name + " - " + self.category + " - " + self.price.to_s
    end

    #private helpers
    private

end
