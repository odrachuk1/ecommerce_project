class FragranceFamilyController < ApplicationController
  def index
    @fragranceFamilies = FragranceFamily.all
  end

  def show
    @fragranceFamily = FragranceFamily.find_by(id: params[:id])
  end
end
