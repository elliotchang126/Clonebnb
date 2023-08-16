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

    CATEGORIES = ['amazing pools', 'amazing views', 'beachfront', 'cabin', 'countryside', 'design', 'iconic cities', 'mansions', 'omg'].freeze

    validates :address, :city, :state, :country, :zip_code, :title, :description, :bedrooms, :bathrooms, :price, :cleaning_fee, :longitude, :latitude, presence: true

    validates :category, inclusion: { in: CATEGORIES }
    validates :bedrooms, :bathrooms, :price, :cleaning_fee, numericality: {only_integer: true, greater_than: 0}
    validates :address, uniqueness: { scope: [:city, :zip_code], message: 'Address already exists in this city and zip code' }

    has_one_attached :photo

    belongs_to :user

end
