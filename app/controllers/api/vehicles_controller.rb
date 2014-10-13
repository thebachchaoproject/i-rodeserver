module Api
  class VehiclesController < ApplicationController
    respond_to :json

    def index
      respond_with(:status => :ok, data: "welcome to safetyapp")
    end

    def show
      puts "Params: #{params}"
      render json: Vehicle.where("vehicle_number like '%#{params[:vehicle_no]}%'").to_json(:include => {:vehiclereviews => 
                                {:except => [:vehicle_id, :id, :created_at, :updated_at]}}, 
                                :except => [:created_at, :updated_at, :id])
      #respond_with(:status => :ok, data: "welcome to safetyapp")      
    end

    def update
      respond_with(:status => :ok, data: "welcome to safetyapp")
    end

    def create
      puts "Safetyapp - Request: #{request.params}"
      puts "that was before we formatted"
      puts " =--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--="
      mypayload = %w{safety_rating date_of_travel driver_name gps_or_location review photo_link }
      params[:vehicle][:vehiclereviews_attributes] = []
      myhash = {}
      params.each do |key, value|
        puts "inside params.each #{key}"
        if mypayload.include? key
          puts "inside mypayload #{value}"
          myhash[key] = value
          params.delete(key)

        end
        
      end
      params[:vehicle][:vehiclereviews_attributes] << myhash
      puts "and we're done formatting"
      puts " =--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--="
      puts params
      #render :json => {:status => 'bleh'}, :status => 500

      if Vehicle.where("vehicle_number like '%#{accepted_params[:vehicle_number]}%'").empty?
        puts "vehicle not found"
        render json: Vehicle.create(accepted_params), :status => 201
      else
        puts "vehicle found... moving on"
        @v = Vehicle.where("vehicle_number like '%#{accepted_params[:vehicle_number]}%'").first
        puts accepted_params[:vehiclereviews_attributes]
        @v.vehiclereviews.build(accepted_params[:vehiclereviews_attributes])
        if @v.save 
          render :json => {:status => "Your data has been saved successfully!"}, :status => 201
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