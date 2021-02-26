class ProductsController < ApplicationController
    before_action :find_product, only: :show
    def index
        @products = Product.top_two_products_ordered_by_name_where_price_greater_than_50(2)
    end

    def show
        find_product
    end

    private

    def find_product
        @product = Product.find_by_id(params[:id])
    end
end
