class CitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @cities = City.all
    render json: @cities, each_serializer: CitySerializer
  end
end
