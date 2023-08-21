json.user do
    json.partial! '/api/users/user', user: @user
end

json.reviews do
    @user.reviews.each do |review|
        json.set! review.id do
            json.extract! review, :id, :listing_id, :user_id, :cleanliness, :communication, :check_in, :accuracy, :location, :value, :body

            json.first_name review.user.first_name
            json.listing_title review.listing.title
        end
    end
end

json.reservations do
    @user.reservations.each do |reservation|
        json.set! reservation.id do
            json.extract! reservation, :id, :listing_id, :user_id, :num_guests, :start_date, :end_date
        end
    end
end

#json.reviews @user.reviews do |review|
# end