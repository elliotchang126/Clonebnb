json.extract! reservation, :id, :listing_id, :user_id, :num_guests, :start_date, :end_date

json.photoUrl url_for(reservation.listing.photos[0])
json.city reservation.listing.city
json.state reservation.listing.state
json.price reservation.listing.price
json.cleaning_fee reservation.listing.cleaning_fee
json.reviews reservation.listing.reviews
json.overall_rating reservation.listing.overall_rating