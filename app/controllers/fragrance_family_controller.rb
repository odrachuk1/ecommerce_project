class FragranceFamilyController < ApplicationController
  def index
    @fragranceFamilies = FragranceFamily.all
  end

  def show
    @fragranceFamily = FragranceFamily.find_by(id: params[:id])
    @family_id = params[:id]
    @products = Product.select("id", "name", "price", "volume").where(fragrance_family_id: @family_id).page(params[:page])
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @products = Product.where("name LIKE ? AND fragrance_family_id = ?", "%#{@name}%", "#{@family_id}").page(params[:page])
    end
  end
end
