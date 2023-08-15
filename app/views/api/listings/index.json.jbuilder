@listings.each do |listing|
    json.set! listing.id do
        json.partial! '/apli/listings/listing', business: business
    end
end