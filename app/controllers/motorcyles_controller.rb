class MotorcylesController < ApplicationController
  def index
    @motorcles = Motorcycle.all
    render json: @motorcles
  end
end
