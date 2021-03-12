class Brand < ApplicationRecord
    has_many :products
    validates :name, presence: true, uniqueness: true
    validates :year_founded, numericality: {only_integer: true}
end
