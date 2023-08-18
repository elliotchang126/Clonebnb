json.listing do 
    json.partial! '/api/listings/listing', listing: @listing
end
# json.host @listing.user.first_name
json.reviews do
    @listing.reviews.each do |review|
        json.set! review.id do
            json.extract! review, :id, :listing_id, :user_id, :cleanliness, :communication, :check_in, :accuracy, :location, :value, :body
        end
    end
end
