class ProductsController < ApplicationController
    before_action :find_product, only: [:show, :edit, :update, :destroy]

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
        @product = Product.new(product_params(:name, :price, :availability, :category))
        if @product.save
            # redirect_to "/products/#{product.id}"
            # redirect_to product_path(product)
            redirect_to product
        else
            render :new
        end
    end

    def edit
    end

    def update
        @product.update(product_params(:name, :price, :availability, :category))
        if @product.valid?
            # redirect_to "/products/#{product.id}"
            # redirect_to product_path(product)
            redirect_to @product
        else
            render :edit
        end
    end

    def destroy
        if @product.destroy
            redirect_to products_path
        else
            redirect_to back
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
