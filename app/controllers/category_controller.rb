class CategoryController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(id: params[:id])
    @category_id = params[:id]
    @products = Product.select("id", "name").where(category_id: @category_id)
  end
end
