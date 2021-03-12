class BrandsController < ApplicationController
    before_action :find_brand, only: [:show, :edit, :update, :destroy]

    def index
        @brands = Brand.all
    end

    def show
    end

    def new
        @brand = Brand.new
    end

    def create
        @brand = Brand.create(brand_params(:name, :year_founded, :mission))
        if @brand.valid?
            redirect_to @brand
        else
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
        @brand.destroy
    end

    private

    def brand_params(*args)
        params.require(:brand).permit(*args)
    end

    def find_brand
        @brand = Brand.find_by(id: params[:id])
    end
end
