class MotorcirclesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_motorcyle, only: %i[show edit update destroy]

  def index
    @motorcircles = Motorcircle.all
    render json: @motorcircles, each_serializer: MotorcircleSerializer
  end

  def show
    render json: @motorcircle, serializer: MotorcircleSerializer
  end

  def new
    @motorcircle = Motorcircle.new
  end

  def create
    @motorcircle = current_user.motorcircles.build(motorcircle_params)

    if @motorcircle.save
      render json: { message: "created successfully!", status: :created, location:@motorcircle}
    else
      render json: { error: @motorcircle.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @motorcircle.update(motorcircle_params)
      render json: { message: "Updated successfully!", location: @motorcircle }
    else
      render json: {error: @motorcircle.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_motorcyle
    @motorcircle = Motorcircle.find(params[:id])
  end

  def motorcircle_params
    params.require(:motorcircle).permit(:name, :bio, :image, :finance_fee, :option_to_purchase, :total_amount_payable, :duration)
  end
end
