class ProductController < ApplicationController
  def index
    @products = Product.all.page(params[:page])
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @products = Product.where("name LIKE ?", "%#{@name}%").page(params[:page])
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
  end
end