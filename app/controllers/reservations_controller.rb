class ReservationsController < ApplicationController

  private
  def set_motorcicle
    @user = Motorcircle.find(params[:motorcircle_id])
  end
end
