class Api::ReservationsController < ApplicationController

    def index
        @reservations = Reservation.where(user_id: current_user.id)
        render :index
    end

    def show
        @reservation = Reservation.find_by(id: params[:id])
        render :show
    end

    def create
        @reservation = Reservation.new(reservation_params)
        @reservation.user_id = current_user.id
        if @reservation.save
            render :show
        else
            render json: @reservation.errors.full_messages, status: 422
        end
    end

    def update
        @reservation = Reservation.find_by(id: params[:id])
        if @reservation.user_id == current_user.id && @reservation.update(review_params)
            render json: {message: 'success!'}
        else
            render json: @reservation.errors.full_messages, status: 422
        end
    end

    def destroy
        @reservation = Reservation.find_by(id: params[:id])
        if @reservation
            @reservation.destroy
        else
            render json: @reservation.errors.full_messages, status: 422
        end
    end


    private

    def reservation_params
        params.require(:reservation).permit(:listing_id, :num_guests, :start_date, :end_date)
    end
end
