json.extract! listing, :id, :user_id, :category, :address, :city, :state, :country, :zip_code, :title, :description, :bedrooms, :bathrooms, :price, :cleaning_fee, :longitude, :latitude

# json.photoUrl listing.photo.attached? ? listing.photo.url : nil
json.photosUrl listing.photos.attached? ? listing.photos.map{ |photo| url_for(photo) } : []