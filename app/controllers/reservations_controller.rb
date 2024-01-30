class ReservationsController < ApplicationController

  private
  def set_motorcicle
    @user = Motorcircle.find(params[:motorcircle_id])
  end

  def reservation_params
    params.require(:reservation).permit(:name, :date, :city)
  end
end
