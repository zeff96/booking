class MotorcylesController < ApplicationController
  before_action :set_motorcyle, only: %i[show edit update destroy]
  def index
    @motorcles = Motorcycle.all
    render json: @motorcles
  end

  def show
    render json: @motorcle
  end

  private

  def set_motorcyle
    @motorcle = Motorcycle.find(params[:id])
  end
end
