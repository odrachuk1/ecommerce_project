class BrandController < ApplicationController
  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find_by(id: params[:id])
    @brand_id = params[:id]
    @products = Product.select("id", "name").where(brand_id: @brand_id)
  end
end
