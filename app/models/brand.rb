class Brand < ApplicationRecord
    has_many :products
    validates :name, presence: true, uniqueness: true
    validates :year_founded, numericality: {only_integer: true}
    # accepts_nested_attributes_for :products

    def products_attributes=(attributes)
        if !attributes["0"]["name"].blank?
            self.products << Product.find_or_create_by(attributes["0"])
        end
    end


end
