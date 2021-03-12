class Product < ApplicationRecord
    belongs_to :brand

    #validations
    validates :name,  presence: true, uniqueness: true, length: {minimum: 7}, two_words: true #new custom validation called two_words
    validates :availability, presence: true
    validates :category, presence: true, inclusion: {in: %w(clothing accessories electronics groceries)}
    validates :price, presence: true
    # before_validation :check_for_capitalization
    # accepts_nested_attributes_for :brand, reject_if: proc { |attributes| attributes['name'].blank? || attributes['year_founded'].blank?}

    def brand_attributes=(attributes)
        if !attributes["name"].blank? && !attributes["year_founded"].blank?
            self.brand = Brand.find_or_create_by(name: attributes[:name], year_founded: attributes[:year_founded], mission: attributes[:mission])
        end
    end

    scope :top_two_products_ordered_by_name_where_price_greater_than_50, ->(num) {where("price > ?", 50).order(:name).limit(num)}

    #custom methods
    def title_for_index
        self.name + " - " + self.category + " - " + self.price.to_s
    end

    #private helpers
    private

end
