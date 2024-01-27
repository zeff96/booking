class MotorcylesController < ApplicationController
  def index
    @motorcles = Motorcycle.all
    render json: @motorcles
  end

  

  private

  def set_motorcyle
    @motorcle = Motorcycle.find(params[:id])
  end
end
