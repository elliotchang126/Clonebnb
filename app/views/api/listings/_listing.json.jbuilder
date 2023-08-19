json.extract! listing, :id, :user_id, :category, :address, :city, :state, :country, :zip_code, :title, :description, :bedrooms, :bathrooms, :price, :cleaning_fee, :longitude, :latitude

json.set! :overall_rating, listing.overall_rating
# json.photoUrl listing.photo.attached? ? listing.photo.url : nil
json.photoUrls listing.photos.attached? ? listing.photos.map{ |photo| url_for(photo) } : []

