class Brand < ApplicationRecord
    has_many :products
    validates :name, presence: true, uniqueness: true
    validates :year_founded, numericality: {only_integer: true}
    # accepts_nested_attributes_for :products

    def products_attributes=(attributes)
        if !attributes["name"].blank?
            self.products << Product.find_or_create_by(attributes)
        end
    end


end
