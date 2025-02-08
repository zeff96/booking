class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations
    render json: @reservations, each_serializer: ReservationSerializer
  end


  def create
    @reservation = current_user.reservations.create!(reservation_params)
    render json: {message: "Created successfully"}, status: :created
  rescue ActionController::ParameterMissing => e
    render json: {error: e.message}, status: :bad_request
  rescue ActiveRecord::RecordInvalid => invalid
    render json: {error: invalid}, status: :unprocessable_entity
  end

  private

  def reservation_params
    params.require(:reservation).permit(:city, :date, :motorcycle_id)
  end
end
