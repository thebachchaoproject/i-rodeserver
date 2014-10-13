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
      puts "Safetyapp - Accepted Params: #{accepted_params}"
      puts "Safetyapp - Request: #{request.params}"
      
      if Vehicle.where("vehicle_number like '%#{accepted_params[:vehicle_number]}%'").empty?
        render json: Vehicle.create(accepted_params)
      else
        @v = Vehicle.where("vehicle_number like '%#{accepted_params[:vehicle_number]}%'").first
        @v.vehiclereviews.build(accepted_params[:vehiclereviews_attributes])
        if @v.save 
          render :json => {:status => "Your data has been saved successfully!"}, :status => 200
        else 
          render :json => {:status => "Failed to save. Please try again!"}, :status => 500
        end
      end
    end

    def destroy
    end

    private

    def accepted_params
      params.require(:vehicle).permit( :vehicle_number, :transport_mode, vehiclereviews_attributes: [:id, :vehicle_id, :safety_rating, :date_of_travel, :gps_or_location, :driver_name, :review, :photo_link] )
    end

  end
end