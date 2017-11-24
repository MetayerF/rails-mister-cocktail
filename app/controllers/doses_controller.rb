class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    # <Dose id: nil, cocktail_id: nil, ingredient_id: 6, description: "1/4">

    # @cocktail.doses << @dose # SAVE

    @dose.cocktail = @cocktail

    if @dose.save
      # <Dose id: 1, cocktail_id: 1, ingredient_id: 6, description: "1/4">
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    dose = Dose.find(params[:id])
    dose.destroy

    redirect_to cocktail_path(dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
