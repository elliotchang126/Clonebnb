class Api::ListingsController < ApplicationController

    def index
        if params[:category]
            @listings = Listing.where("lower(category) = ?", params[:category].downcase)
        else
            @listings = Listing.all
        end
        render :index
    end

    def show
        @listing = Listing.includes(:reviews).find_by(id: params[:id])
        if @listing
            render :show
        else
            render json: {errors: ['Listing does not exist']}, status: 404
        end
    end

end
