module Api
  class VehiclesController < ApplicationController
    respond_to :json

    def index
      respond_with(:status => :ok, data: "welcome to safetyapp")
    end

    def show
      respond_with(:status => :ok, data: "welcome to safetyapp")      
    end

    def update
      respond_with(:status => :ok, data: "welcome to safetyapp")
    end

    def create
      puts "Accepted Params: #{accepted_params.inspect}"
      render json: {:status => :ok}
    end

    def destroy
    end

    private

    def accepted_params
      params.require(:vehicle).permit(:vehicle_number, :transport_mode,
        :vehiclereviews_attributes => [:date_of_travel, :gps_or_location, :driver_name, :safety_rating, :review, :photolink, :_destroy])
    end

  end
end