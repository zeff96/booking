class ReservationsController < ApplicationController
  before_action :set_motorcicle

  def index
  end

  def new
  end

  def create
  end

  private
  def set_motorcicle
    @user = Motorcircle.find(params[:motorcircle_id])
  end

  def reservation_params
    params.require(:reservation).permit(:name, :date, :city)
  end
end
