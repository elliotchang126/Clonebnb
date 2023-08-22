json.extract! reservation, :id, :listing_id, :user_id, :num_guests, :start_date, :end_date

json.photoUrl url_for(reservation.listing.photos[0])
json.city reservation.listing.city
json.state reservation.listing.state