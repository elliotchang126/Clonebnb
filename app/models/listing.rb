# == Schema Information
#
# Table name: listings
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  address      :string           not null
#  city         :string           not null
#  state        :string           not null
#  country      :string           not null
#  zip_code     :string           not null
#  title        :string           not null
#  description  :text             not null
#  bedrooms     :integer          not null
#  bathrooms    :integer          not null
#  price        :integer          not null
#  cleaning_fee :integer          not null
#  longitude    :float            not null
#  latitude     :float            not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category     :string           not null
#
class Listing < ApplicationRecord

    CATEGORIES = ['amazing pools', 'amazing views', 'beachfront', 'cabin', 'countryside', 'design', 'iconic cities', 'lakeside', 'mansions', 'omg'].freeze

    validates :address, :city, :state, :country, :zip_code, :title, :description, :bedrooms, :bathrooms, :price, :cleaning_fee, :longitude, :latitude, presence: true

    validates :category, inclusion: { in: CATEGORIES }
    validates :bedrooms, :bathrooms, :price, :cleaning_fee, numericality: {only_integer: true, greater_than: 0}
    validates :address, uniqueness: { scope: [:city, :zip_code], message: 'Address already exists in this city and zip code' }

    has_many_attached :photos

    belongs_to :user

    has_many :reviews,
        dependent: :destroy

    def overall_rating
        return nil unless reviews.any?
        # reviews.average(:average_rating).round(2)
        avg_ratings = reviews.map(&:average_rating)
        (avg_ratings.sum / avg_ratings.length).round(2)
    end

    def avg_cleanliness
        return nil unless reviews.any?
        total = 0.0
        reviews.each { |review| total += review.cleanliness }
        average = (total / reviews.length).round(1)
        return average
    end

    def avg_communication
        return nil unless reviews.any?
        total = 0.0
        reviews.each { |review| total += review.communication }
        average = (total / reviews.length).round(1)
        return average
    end

    def avg_check_in
        return nil unless reviews.any?
        total = 0.0
        reviews.each { |review| total += review.check_in }
        average = (total / reviews.length).round(1)
        return average
    end

    def avg_accuracy
        return nil unless reviews.any?
        total = 0.0
        reviews.each { |review| total += review.accuracy }
        average = (total / reviews.length).round(1)
        return average
    end

    def avg_location
        return nil unless reviews.any?
        total = 0.0
        reviews.each { |review| total += review.location }
        average = (total / reviews.length).round(1)
        return average
    end

    def avg_value
        return nil unless reviews.any?
        total = 0.0
        reviews.each { |review| total += review.value }
        average = (total / reviews.length).round(1)
        return average
    end
end
