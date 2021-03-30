class BrandsController < ApplicationController
    before_action :find_brand, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in

    def index
        #when using 'brand.products.length' in the _brand partial: 
            #@brands = Brand.includes([:products])
        #when using 'brand.products_count' in the _brand partial:
            #@brands = Brand.joins(:products).select("brands.*", 'COUNT("products.id") AS products_count').group("brands.id")
        #when using 'brand.products.size' in the _brand partial we can implement a counter cache
            #check out the last migration file and the 'counter_cache: true' inside the model Product line 2
            @brands = Brand.all
    end

    def show
    end

    def new
        @brand = Brand.new
        @brand.products.build
    end

    def create
        @brand = Brand.create(brand_params(:name, :year_founded, :mission, products_attributes: [:name, :category, :availability, :price]))
        if @brand.valid?
            redirect_to @brand
        else
            @brand.products.build
            render :new
        end
    end

    def edit
    end

    def update
        @brand.update(brand_params(:name, :year_founded, :mission))
        if @brand.valid?
            redirect_to @brand
        else
            render :edit
        end
    end

    def destroy
        if @brand.destroy
            redirect_to brands_path
        else
            redirect_to @brand
        end
    end

    private

    def brand_params(*args)
        params.require(:brand).permit(*args)
    end

    def find_brand
        @brand = Brand.find_by(id: params[:id])
    end
end