class CategoryController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(id: params[:id])
    @category_id = params[:id]
    @products = Product.select("id", "name", "image", "price", "volume", "category_id").where(category_id: @category_id)
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @products = Product.where("name LIKE ? AND category_id = ?", "%#{@name}%", "#{@category_id}").page(params[:page])
    end
  end
end
