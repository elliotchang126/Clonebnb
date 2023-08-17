class Api::ReviewsController < ApplicationController

    before_action :require_logged_in, only: [:create, :update, :destroy]

    def index
        @reviews = Review.find_by(listing_id: params[:listing_id])
        render :index
    end

    def show
       @review = Review.find_by(id: params[:id])
        if @review
            render :show
        else
            render json: @review.errors.full_messages, status: 422
    end

    def create
        @review = Review.new(review_params)
        @review.user_id = current_user.id
        if @review.save
            render :index
        else
            render json: @review.errors.full_messages, status: 422
        end
    end

    def update
        @review = Review.find_by(id: params[:id])
        if @review.user_id == current_user.id && @review.update(review_params)
            render :index
        else
            render json: @review.errors.full_messages, status: 422
        end
    end

    def destroy
        @review = Review.find_by(id: params[:id])
        if @review.destroy
            render :index
        else
            render json: @review.errors.full_messages, status: 422
        end
    end

    def review_params
        params.require(:user).permit(:cleanliness, :communication, :check_in, :accuracy, :location, :value, :body)
    end
end
