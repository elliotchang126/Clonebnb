class Api::ListingsController < ApplicationController

    def index
        @listings = Listing.all

        if params[:search]
            @listings = @listings.where("city ILIKE ?", "%#{params[:search]}%")
        end
        if params[:state]
            @listings = @listings.where("state ILIKE ?", "%#{params[:state]}%")
        end
        if params[:category]
            @listings = @listings.where("lower(category) = ?", params[:category].downcase)
        end
        render :index
    end

    def show
        @listing = Listing.includes(:reviews, :reservations).find_by(id: params[:id])
        if @listing
            render :show
        else
            render json: {errors: ['Listing does not exist']}, status: 404
        end
    end

end
