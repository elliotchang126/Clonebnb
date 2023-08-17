class Api::ReviewsController < ApplicationController

    def index
        @reviews = Review.find_by(listing_id: params[:listing_id])
        render :index
    end

    def create
        @review = Review.new(review_params)

        if @review
            render :index
        else
            render @review.errors.full_messages, status: 422
        end
    end

    def update

    end

    def destroy

    end

    def review_params
        params.require(:user).permit(:cleanliness, :communication, :check_in, :accuracy, :location, :value, :body)
    end
end
