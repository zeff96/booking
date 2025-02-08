class MotorcyclesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_motorcycle, only: [:show, :edit, :update, :destroy]
  
  def index
    @motorcycles = Motorcycle.all
    render json: @motorcycles, each_serializer: MotorcircleSerializer
  end

  def show
    render json: @motorcycle, serializer: MotorcircleSerializer
  end

  def create
    @motorcycle = current_user.motorcycles.new(motorcycle_params)

    if @motorcycle.save
      render json: {message: "Motorcycle created successfully!", motorcycle: @motorcycle}, status: :created
    else
      render json: {message: "Failed to create motorcycle"}, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @motorcycle.update(motorcycle_params)
      render json: {message: "Motorcycle updated successfully!"}, status: :ok
    else
      render json: {message: "Failed to update motorcycle"}, status: :unprocessable_entity
    end
  end

  def destroy
    if @motorcycle.destroy
      render json: {message: "Motorcycle deleted successfully!"}, status: :no_content
    else
      render json: {message: "Failed to delete motorcycle"}, status: :unprocessable_entity
    end
  end

  private

  def motorcycle_params
    params.require(:motorcycle).permit(:name, :bio, :image, :finance_fee, :option_to_purchase, :total_amount_payable, :duration)
  end

  def set_motorcycle
    @motorcycle = Motorcycle.find(params[:id])
  end
end
