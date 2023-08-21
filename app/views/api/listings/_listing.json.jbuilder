json.extract! listing, :id, :user_id, :category, :address, :city, :state, :country, :zip_code, :title, :description, :bedrooms, :bathrooms, :price, :cleaning_fee, :longitude, :latitude

json.set! :overall_rating, listing.overall_rating

json.set! :average_cleanliness, listing.avg_cleanliness
json.set! :average_communication, listing.avg_communication
json.set! :average_check_in, listing.avg_check_in
json.set! :average_accuracy, listing.avg_accuracy
json.set! :average_location, listing.avg_location
json.set! :average_value, listing.avg_value
json.set! :reviews_length, listing.reviews.length

# json.photoUrl listing.photo.attached? ? listing.photo.url : nil
json.photoUrls listing.photos.attached? ? listing.photos.map{ |photo| url_for(photo) } : []

