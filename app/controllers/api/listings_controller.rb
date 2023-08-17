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
        @listing = Listing.find_by(id: params[:id])
        if @listing
            render :show
        else
            render json: ['Listing does not exist']
        end
    end

end
