json.listing do 
    json.partial! '/api/listings/listing', listing: @listing
end
# json.host @listing.user.first_name
json.reviews do
    @listing.reviews.each do |review|
        json.set! review.id do
            json.extract! review, :id, :listing_id, :user_id, :cleanliness, :communication, :check_in, :accuracy, :location, :value, :body

            json.first_name review.user.first_name
        end
    end
end

json.reservations do
    @listing.reservations.each do |reservation|
        json.set! reservation.id do
            json.extract! reservation, :id, :listing_id, :user_id, :num_guests, :start_date, :end_date
        end
    end
end