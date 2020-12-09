class BrandController < ApplicationController
  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find_by(id: params[:id])
    @brand_id = params[:id]
    @products = Product.select("id", "name", "price", "volume", "brand_id").where(brand_id: @brand_id).page(params[:page])
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @products = Product.where("name LIKE ? AND brand_id = ?", "%#{@name}%", "#{@brand_id}").page(params[:page])
    end
  end
end
