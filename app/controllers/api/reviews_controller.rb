class Api::ReviewsController < ApplicationController

    # before_action :require_logged_in, only: [:create, :update, :destroy]

    def index
        @reviews = Review.where(listing_id: params[:id])
        render :index
    end

    def show
       @review = Review.find_by(id: params[:id])
        if @review
            render :show
        else
            render json: {errors: @review.errors.full_messages}, status: 422
        end
    end

    def create
        @review = Review.new(review_params)
        # @review.listing_id = params[:listing_id]
        @review.user_id = current_user.id
        if @review.save
            # @listing = Listing.find_by(id: params[:listing_id])
            render :show
        else
            puts @review.errors.full_messages
            render json: {errors: @review.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        @review = Review.find_by(id: params[:id])
        if @review.user_id == current_user.id && @review.update(review_params)
            render json: {message: 'success!'}
        else
            render json: {errors: @review.errors.full_messages}, status: 422
        end
    end

    def destroy
        @review = Review.find_by(id: params[:id])
        if @review
            @review.destroy
        else
            render json: {errors: @review.errors.full_messages}, status: 422
        end
    end

    def review_params
        params.require(:review).permit(:id, :user_id, :listing_id, :cleanliness, :communication, :check_in, :accuracy, :location, :value, :body)
    end
end
