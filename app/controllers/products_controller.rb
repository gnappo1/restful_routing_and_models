class ProductsController < ApplicationController
    before_action :find_product, only: [:show, :edit, :update, :destroy]

    #the following code comes from the lecture on refactoring with layout, partials, and helpers
    # helper_method [:find_product]
    # layout "brands"

    def homepage
        render :homepage
    end
    
    def index
        @products = Product.all
        #the following code comes from the lecture on refactoring with layout, partials, and helpers
        # render :index, layout: "products"
    end

    def show
        find_product
    end

    def new
        @product = Product.new
        @product.build_brand
    end

    def create
        @product = Product.new(product_params(:name, :price, :availability, :category, :brand_id, brand_attributes: [:name, :year_founded, :mission]))
        if @product.save
            redirect_to @product
        else
            @product.build_brand
            render :new
        end
    end

    def edit
    end

    def update
        @product.update(product_params(:name, :price, :availability, :category))
        if @product.valid?
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
