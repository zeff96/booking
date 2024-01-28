class MotorcirclesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_motorcyle, only: %i[show edit update destroy]

  def index
    @motorcircles = Motorcycle.all
    render json: @motorcircles
  end

  def show
    render json: @motorcircle
  end

  def new
    @motorcircle = Motorcycle.new
  end

  def create
    @motorcircle = current_user.motorcircles.build(motorcircle_params)

    if @motorcircle.save
      render json: { message: "created successfully!", status: :created, location:@motorcircle}
    else
      render json: { error: @motorcircle.errors.full_message }
    end
  end

  def edit; end

  def update
  end

  def destroy
  end

  private

  def set_motorcyle
    @motorcircle = Motorcycle.find(params[:id])
  end

  def motorcircle_params
    params.require(:motorcircle).permit(:name, :image, :finance_fee, :option_to_purchase, :total_amount_payable, :duration)
  end
end
