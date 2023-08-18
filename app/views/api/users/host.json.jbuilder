json.user do
    json.partial! '/api/users/user', user: @user
end

json.reviews do
    @user.reviews.each do |review|
        json.set! review.id do
            json.extract! review, :id, :listing_id, :user_id, :cleanliness, :communication, :check_in, :accuracy, :location, :value, :body
        end
    end
end

#json.reviews @user.reviews do |review|
# end