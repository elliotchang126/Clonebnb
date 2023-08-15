class Api::ListingsController < ApplicationController

    def index
        @listings = Listing.all
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
