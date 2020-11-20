class FragranceFamilyController < ApplicationController
  def index
    @fragranceFamilies = FragranceFamily.all
  end

  def show
    @fragranceFamily = FragranceFamily.find_by(id: params[:id])
    @family_id = params[:id]
    @products = Product.select("id", "name").where(fragrance_family_id: @family_id)
  end
end
