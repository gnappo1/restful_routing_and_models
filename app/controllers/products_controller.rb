class ProductsController < ApplicationController
    before_action :find_product, only: :show

    def index
        @products = Product.all
    end

    def show
        find_product
    end

    def new
        @product = Product.new
    end

    def create
        product = Product.new(product_params(:name, :price, :availability, :category))
        if product.save
            # redirect_to "/products/#{product.id}"
            # redirect_to product_path(product)
            redirect_to product
        else
            render :new
        end
    end

    private

    def product_params(*args)
        params.require(:product).permit(*args)
    end

    def find_product
        @product = Product.find_by_id(params[:id])
    end
end
