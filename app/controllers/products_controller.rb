class ProductsController < ApplicationController
    before_action :find_product, only: [:show, :edit, :update, :destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :deny_access

    def homepage
        render :homepage
    end
    
    def index
        if params["search"]
            @products = Product.search_by_name(params["search"])
        elsif params[:brand_id] && @brand = Brand.find(params[:brand_id])
            @products = @brand.products
        else
            @products = Product.all
        end
    end

    def show
        find_product
    end

    def new
        if params[:brand_id] && @brand = Brand.find(params[:brand_id])
            @product = Product.new(brand_id: params[:brand_id])
        else
            @product = Product.new
            build_brand
        end   
    end

    def create
        @product = Product.new(product_params(:name, :price, :availability, :category, :brand_id, brand_attributes: [:name, :year_founded, :mission]))
        @brand = Brand.find(params[:brand_id]) if params[:brand_id]
        if @product.save
            redirect_to @product
        else
            build_brand
            render :new
        end
    end

    def edit
        build_brand
    end

    def update
        @product.update(product_params(:name, :price, :availability, :category, :brand_id, brand_attributes: [:name, :year_founded, :mission]))
        if @product.valid?
            redirect_to @product
        else
            build_brand
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

    def build_brand
        @product.build_brand
    end

    def find_product
        @product = Product.find_by_id(params[:id])
    end

    def deny_access
        render :"errors/record_not_found"
    end
end
